LaunchAssist.Views.AddTierModal = Backbone.View.extend({
  template: JST['tiers/add_tier_modal'],

  events: {
    'click button#tier-submit': 'submitTier'
  },

  initialize: function(options) {
    this.$el = options.$addTierModalEl;
    this.projectId = -1;
    this.listenTo(Backbone, 'editTier', this.updateTierCollection);
    this.render();
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submitTier: function(event) {
    this.projectId = parseInt(Backbone.history.getFragment().match(/^projects\/(\d+)/)[1]);
    event.preventDefault();
    var tierData = $('form#new-tier-form').serializeJSON();
    tierData.project_id = this.projectId;
    var tier = new LaunchAssist.Models.Tier();
    tier.set(tierData);
    tier.save({}, {
      success: function() {
        this.collection.add(tier);
      }.bind(this)
    });
  },

  updateTierCollection: function(options) {
    this.collection = options.collection;
  }
});
