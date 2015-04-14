LaunchAssist.Collections.Projects = Backbone.Collection.extend({
  url: 'api/categories/' + this.categoryId + '/projects',
  model: LaunchAssist.Models.Project,
  
  initialize: function(models, options) {
    this.categoryId = options.categoryId;
    this.url = 'api/categories/' + this.categoryId + '/projects';
  },

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
