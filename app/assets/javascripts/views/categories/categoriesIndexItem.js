LaunchAssist.Views.CategoriesIndexItem = Backbone.View.extend({
  template: JST['categories/categories_index_item'],
  className: 'category col-md-3',


  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({category: this.model, imageUrl: this.model.get('image_url')});
    this.$el.html(content);
    return this;
  }
});
