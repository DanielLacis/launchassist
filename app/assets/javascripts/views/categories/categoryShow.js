LaunchAssist.Views.CategoryShow = Backbone.CompositeView.extend({
  template: JST['categories/category_show'],
  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },
  render: function() {
    var content = this.template({category: this.model});
    debugger
    this.$el.html(content);
    return this;
  }
});
