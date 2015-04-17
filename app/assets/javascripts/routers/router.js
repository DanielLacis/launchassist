LaunchAssist.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'categoriesIndex', // shows the categories
    'categories/:id': 'categoryShow', // shows the projects for a given category
    'projects/:id/edit': 'projectEdit',
    'projects/:id': 'projectShow'  // shows the actual project
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.$navEl = options.$navEl;
    this.$modalEl = options.$modalEl;
    this.collection = options.categories;
    this.currentUser = options.currentUser;
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
    this.currentUser.fetch();
    var newView = new LaunchAssist.Views.CategoryShow({model: category, currentUser: this.currentUser});
    this._swapView(newView);
  },

  projectShow: function(id) {
    this.project = new LaunchAssist.Models.Project({id: id});
    Backbone.trigger('projectShow', {project_id: id});
    this.project.fetch();
    this.project.tiers().fetch();
    this.project.comments().fetch();
    this.project.photos().fetch();
    this.currentUser.fetch();
    var newView = new LaunchAssist.Views.ProjectShow({model: this.project, collection: this.project.tiers(), currentUser: this.currentUser, comments: this.project.comments(), photos: this.project.photos()});
    this._swapView(newView);
  },

  projectEdit: function(id) {
    this.project = new LaunchAssist.Models.Project({id: id});
    this.collection.fetch();
    this.project.fetch();
    var newView = new LaunchAssist.Views.ProjectEdit({collection: this.collection, model: this.project});
    this._swapView(newView);
  },

  userShow: function() {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
    $(window).scrollTop(0);
  },

});
