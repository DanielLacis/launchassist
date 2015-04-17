LaunchAssist.Views.ProjectCommentItem = Backbone.View.extend({
  template: JST['projects/project_comment_item'],
  className: '',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({comment: this.model});
    this.$el.html(content);
    return this;
  }
});
