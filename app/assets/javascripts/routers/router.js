LaunchAssist.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'index', // shows the categories
    'categories/:id': 'projectIndex', // shows the projects for a given category
    'projects/:id': 'projectShow'  // shows the actual project
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;

  },
  
  index: function() {

  },

  projectIndex: function() {

  },

  projectShow: function() {

  }
});
