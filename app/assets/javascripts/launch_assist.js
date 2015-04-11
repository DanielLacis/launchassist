window.LaunchAssist = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $('div#main');
    new LaunchAssist.Routers.Router({$rootEl: $rootEl});
    Backbone.history.start();
  }
};
