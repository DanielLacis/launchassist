LaunchAssist.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'categoriesIndex', // shows the categories
    'categories/:id': 'projectIndex', // shows the projects for a given category
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
    this.currentUser.fetch();
    var newView = new LaunchAssist.Views.CategoriesIndex({collection: this.collection});
    this._swapView(newView);
    // var view;
    // debugger
    // this.collection.fetch({
    //   success: function() {
    //     this.collection.each(function(category) {
    //       view = new LaunchAssist.Views.CategoriesIndexItem({model: category});
    //       newView.addSubview('.categories', view);
    //     });
    //   }.bind(this)
    // });
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
