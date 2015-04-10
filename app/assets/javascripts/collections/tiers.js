LaunchAssist.Collections.Tiers = Backbone.Collection.extend({
  url: 'api/projects/' + this.projectId + '/tiers', // unnecessary due to initialize?
  model: LaunchAssist.Models.Tier,

  initialize: function(options) {
    this.projectId = options.projectId;
    this.url = 'api/projects/' + this.projectId + '/tiers';
  },

  getOrFetch: function(id) {
    var tier = this.get(id);
    if (tier) {
      tier.fetch();
    } else {
      tier = new LaunchAssist.Models.Tier({id: id});
      tier.fetch({
        success: function() {
          this.add(tier);
        }.bind(this)
      });
    }
    return tier;
  }
});
