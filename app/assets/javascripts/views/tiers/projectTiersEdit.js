LaunchAssist.Views.ProjectTiersEdit = Backbone.CompositeView.extend ({
  template: JST['tiers/project-tiers-edit'],

  initialize: function(options) {
    this.collection.each(function(tier) {
      this.addTierEditView(tier);
    });
    this.listenTo(this.collection, 'add', this.addTierEditView);
    Backbone.trigger('editTier', {collection: this.collection});
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  addTierEditView: function(tier) {
    var newView = new LaunchAssist.Views.TierEditView({model: tier});
    this.addSubview('div#tier-edits', newView);
  }
});
