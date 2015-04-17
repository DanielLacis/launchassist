LaunchAssist.Views.ProjectCommentItem = Backbone.View.extend({
  template: JST['projects/project_comment_item'],
  className: 'project-comment-item',
  events: {
    'click button#comment-item-delete': 'deleteComment'
  },

  initialize: function(options) {
    this.currentUser = options.currentUser;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({comment: this.model, currentUser: this.currentUser});
    this.$el.html(content);
    return this;
  },

  deleteComment: function(event) {
    this.model.destroy({
      success: function() {
        Backbone.trigger('deletedComment', this);
      }.bind(this)
    });
  }
});
