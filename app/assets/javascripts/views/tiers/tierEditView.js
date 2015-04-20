LaunchAssist.Views.TierEditView = Backbone.View.extend({
  template: JST['tiers/tier-edit-view'],
  className: 'tier-edit row',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({tier: this.model});
    this.$el.html(content);
    return this;
  }
});
