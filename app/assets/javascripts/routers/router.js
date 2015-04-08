LaunchAssist.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'categoriesIndex', // shows the categories
    'categories/:id': 'projectIndex', // shows the projects for a given category
    'projects/:id': 'projectShow'  // shows the actual project
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = new LaunchAssist.Collections.Categories();
    this.collection.fetch();
  },

  categoriesIndex: function() {
    alert('danger');
    var newView = new LaunchAssist.Views.CategoriesIndex({collection: this.collection});
    this._swapView(newView);
  },

  categoryShow: function() {

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
