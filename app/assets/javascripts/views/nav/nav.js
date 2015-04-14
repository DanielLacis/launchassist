LaunchAssist.Views.Nav = Backbone.CompositeView.extend({
  template: JST['nav/nav'],

  initialize: function(options) {
    this.$el = options.$navEl;
    this.router = options.router;
    this.renderUrl = null;
    this.renderTitle = null;
    this.listenTo(this.router, 'route:categoriesIndex', this.removeCategoryLink);
    this.listenTo(this.router, 'route:categoryShow', this.removeCategoryLink);
    this.listenTo(Backbone, 'setActiveTab', this.setActiveTab);
  },

  setActiveTab: function (options) {
    this.renderUrl = options.url;
    this.renderTitle = options.title;
    this.render();
  },

  render: function() {
    var content = this.template({url: this.renderUrl, title: this.renderTitle});
    this.$el.html(content);
    return this;
  },

  removeCategoryLink: function() {
    if (this.renderUrl || this.renderTitle) {
      this.renderUrl = null;
      this.renderTitle = null;
      this.render();
    }
  }
});
