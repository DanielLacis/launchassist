LaunchAssist.Views.PhotoViewItem = Backbone.View.extend({
  template: JST['projects/project_photo_item'],
  className: 'project-photo-view-item',

  events: {
    'click img.project-sub-photo': 'showPhotoModal'
  },

  initialize: function(options) {
    this.currentUser = options.currentUser;
    this.isOwner = options.isOwner;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({photo: this.model});
    this.$el.html(content);
    return this;
  },

  showPhotoModal: function(event) {
    event.preventDefault();
    Backbone.trigger('showPhotoModal', {photo: this.model, isOwner: this.isOwner}); 
  }
});
