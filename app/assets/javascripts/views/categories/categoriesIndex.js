LaunchAssist.Views.CategoriesIndex = Backbone.CompositeView.extend({
  template: JST['categories/categories_index'],

  render: function() {
    var content = this.template({categories: this.collection});
    this.$el.html(content);
    return this;
  }
});
