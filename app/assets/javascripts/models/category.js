LaunchAssist.Models.Category = Backbone.Model.extend({
  urlRoot: 'api/categories',

  projects: function() {
    if (this._projects) {
      return this._projects;
    } else {
      this._projects = new LaunchAssist.Collections.Projects({categoryId: this.get('id')});
    }
    return this._projects;
  }
});
