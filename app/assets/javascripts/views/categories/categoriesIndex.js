LaunchAssist.Views.CategoriesIndex = Backbone.CompositeView.extend({
  template: JST['categories/categories_index'],

  initialize: function() {
    this.collection.each(function(model) {
      var subview = new LaunchAssist.Views.CategoriesIndexItem({model: model});
      this.addSubview('div.categories', subview);
    }.bind(this));
    this.listenTo(this.collection, 'add', this.addToView);
    this.listenTo(this.collection, 'sync', this.render);
    var content = this.template();
    this.$el.html(content);
  },

  render: function() {
    this.attachSubviews();
    return this;
  },

  addToView: function(inputModel) {
    var subview = new LaunchAssist.Views.CategoriesIndexItem({model: inputModel});
    this.addSubview('div.categories', subview);
  }
});
