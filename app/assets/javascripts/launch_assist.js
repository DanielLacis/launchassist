window.LaunchAssist = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    //save router as variable
    //pass router as arg to navbar in options
    //listen to router and re-render on route events
    var $rootEl = $('div#main');
    var $navEl = $('div#nav-el');
    var $modalEl = $('div#new-project-modal');
    new LaunchAssist.Routers.Router({$rootEl: $rootEl, $navEl:  $navEl, $modalEl: $modalEl});
    Backbone.history.start();
  }
};
