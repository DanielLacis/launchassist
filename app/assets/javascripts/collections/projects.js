LaunchAssist.Collections.Projects = Backbone.Collection.extend({
  url: 'api/projects',
  model: LaunchAssist.Models.Project,

  getOrFetch: function(id) {
    var project = this.get(id);
    if (project) {
      project.fetch();
    } else {
      project = new LaunchAssist.Models.Project();
      project.fetch({
        success: function() {
          this.add(project);
        }.bind(this)
      });
    }
    return project;
  }
});
