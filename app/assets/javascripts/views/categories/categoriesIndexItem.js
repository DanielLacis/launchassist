LaunchAssist.Views.CategoriesIndexItem = Backbone.View.extend({
  template: JST['categories/categories_index_item'],
  className: 'category',

  events: {
    'click': 'linkToCategory'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({category: this.model});
    this.$el.html(content);
    this.$el.css('background-image', 'url(' + this.model.get('image_url') + ')');
    return this;
  },

  linkToCategory: function(event) {
    event.preventDefault();
    Backbone.history.navigate('#categories/' + this.model.get('id'), {trigger: true});
  }
});
