LaunchAssist.Views.ProjectTiersEdit = Backbone.CompositeView.extend ({
  template: JST['tiers/project-tiers-edit'],

  initialize: function(options) {
    this.listenTo(this.collection, 'add', this.addTierEditView);
  },

  render: function() {

  },

  addTierEditView: function() {

  }
});
