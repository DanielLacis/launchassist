LaunchAssist.Models.Tier = Backbone.Model.extend({
  urlRoot: 'api/tiers',

  toJSON: function() {
    var delivery_date = this.get('delivery_date');
    var amount = this.get('amount');
    if (delivery_date) {
      this.set({delivery_date: LaunchAssist.Util.prototype.processEndDate(delivery_date)})
    }
    if (amount) {
      this.set({amount: LaunchAssist.Util.prototype.processGoal(amount)});
    }
    return {tier: this.attributes};
  }
});
