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
    var $photoModalEl = $('div#new-photo-modal');
    var $photoShowModalEl = $('div#photo-show-modal');
    var $addTierModalEl = $('div#tier-add-modal');
    var $editTierModalEl = $('div#tier-edit-modal');
    var categories = new LaunchAssist.Collections.Categories();
    var currentUser = new LaunchAssist.Models.CurrentUser();
    var router = new LaunchAssist.Routers.Router({currentUser: currentUser, categories: categories, $rootEl: $rootEl, $navEl:  $navEl, $modalEl: $modalEl});
    this.navView = new LaunchAssist.Views.Nav({router: router, collection: categories, $navEl: $navEl});
    this.newProjectView = new LaunchAssist.Views.newProjectModal({collection: categories, $modalEl: $modalEl, model: currentUser});
    this.newPhotoView = new LaunchAssist.Views.NewPhotoModal({$photoModalEl: $photoModalEl});
    this.photoShowView = new LaunchAssist.Views.PhotoShowModal({$photoShowModalEl: $photoShowModalEl});
    this.addTierView = new LaunchAssist.Views.AddTierModal({$addTierModalEl: $addTierModalEl});
    this.editTierView = new LaunchAssist.Views.EditTierModal({$editTierModalEl: $editTierModalEl});
    this.navView.render();
    this.newProjectView.render();
    this.newPhotoView.render();
    Backbone.history.start();
  }
};
