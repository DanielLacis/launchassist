LaunchAssist.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'categoriesIndex', // shows the categories
    'categories/:id': 'categoryShow', // shows the projects for a given category
    'projects/:id': 'projectShow'  // shows the actual project
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = new LaunchAssist.Collections.Categories();
    this.currentUser = new LaunchAssist.Models.CurrentUser();
    this.collection.fetch();
    this.currentUser.fetch();
  },

  categoriesIndex: function() {
    this.collection.fetch();
    var newView = new LaunchAssist.Views.CategoriesIndex({collection: this.collection});
    this._swapView(newView);
  },

  categoryShow: function(id) { //:category_id
    var category = this.collection.getOrFetch(id);
    category.projects().fetch();
    var newView = new LaunchAssist.Views.CategoryShow({model: category});
    this._swapView(newView);
  },

  projectShow: function() {

  },

  userShow: function() {

  },

  _swapView: function(view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }
});
