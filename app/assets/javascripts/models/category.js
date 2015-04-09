LaunchAssist.Models.Category = Backbone.Model.extend({
  urlRoot: 'api/categories',

  projects: function() {
    this._projects = this._projects || new LaunchAssist.Collections.Projects({categoryId: this.get('id')});
    this._projects.fetch();
    return this._projects;
  }
});
