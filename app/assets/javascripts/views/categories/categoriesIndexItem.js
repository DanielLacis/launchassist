LaunchAssist.Views.CategoriesIndexItem = Backbone.View.extend({
  template: JST['categories/categories_index_item'],
  className: 'category',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({category: this.model});
    this.$el.html(content);
    this.$el.css('background-image', 'url(' + this.model.get('image_url') + ')');
    return this;
  }
});
