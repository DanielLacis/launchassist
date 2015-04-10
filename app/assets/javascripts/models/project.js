LaunchAssist.Models.Project = Backbone.Model.extend({
  urlRoot: 'api/projects',

  tiers: function() {
    if (this._tiers) {
      return this._tiers;
    } else {
      this._tiers = new LaunchAssist.Collections.Tiers([], {projectId: this.get('id')});
    }
    return this._tiers;
  }
});
