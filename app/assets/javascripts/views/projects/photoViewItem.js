LaunchAssist.Views.PhotoViewItem = Backbone.View.extend({
  template: JST['projects/project_photo_item'],
  className: 'project-photo-view-item',

  initialize: function(options) {
    this.currentUser = options.currentUser;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({photo: this.model});
    this.$el.html(content);
    return this;
  }
});
