LaunchAssist.Views.TierEditView = Backbone.View.extend({
  template: JST['tiers/tier-edit-view'],
  className: 'tier-edit row',

  events: {
    'click button#edit-tier': 'showTierEditModal',
    'click button#remove-tier': 'removeTier'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({tier: this.model});
    this.$el.html(content);
    return this;
  },

  showTierEditModal: function(event) {
    event.preventDefault();
    Backbone.trigger("showTierEditModal", {model: this.model});
  },

  removeTier: function(event) {
    event.preventDefault();
    this.model.destroy({
      success: function() {
        this.collection.remove(this.model);
        Backbone.trigger('removedTierSubview', this);
      }.bind(this)
    });
  }
});
