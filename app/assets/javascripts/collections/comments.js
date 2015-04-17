LaunchAssist.Collections.Comments = Backbone.Collection.extend({
  url: 'api/projects/' + this.projectId + '/comments',
  model: LaunchAssist.Models.Comment,

  initialize: function(models, options) {
    this.projectId = options.projectId;
    this.url = 'api/projects/' + this.projectId + '/comments';
  },

  getOrFetch: function(id) {
    var comment = this.get(id);
    if (comment) {
      comment.fetch();
    } else {
      comment = new LaunchAssist.Models.Comment();
      comment.fetch({
        success: function() {
          this.add(comment);
        }.bind(this)
      });
    }
    return comment;
  },

  comparator: function(comment) {
    return comment.get('created_at');
  }
});
