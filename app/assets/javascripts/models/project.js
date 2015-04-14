LaunchAssist.Models.Project = Backbone.Model.extend({
  urlRoot: 'api/projects',

  tiers: function() {
    if (this._tiers) {
      return this._tiers;
    } else {
      this._tiers = new LaunchAssist.Collections.Tiers([], {projectId: this.get('id')});
    }
    return this._tiers;
  },

  toJSON: function() {
    var end = this.get('end_date');
    var goal = this.get('goal');
    if (this.get('end_date')) {
      this.set({end_date: LaunchAssist.Util.prototype.processEndDate(end)})
    }
    if (this.get('goal')) {
      this.set({goal: LaunchAssist.Util.prototype.processGoal(goal)});
    }
    return {project: this.attributes};
  }
});
