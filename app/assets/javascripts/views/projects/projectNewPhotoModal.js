LaunchAssist.Views.NewPhotoModal = Backbone.View.extend ({
  template: JST['projects/new_photo_modal'],

  events: {

    'change input.photo-upload': 'handleFile',
    'click button#photo-submit': 'savePhoto'
  },

  initialize: function(options) {
    this.$el = options.$photoModalEl;
    this.uploadedPhoto = null;
    this.projectId = -1;
    this.listenTo(Backbone, 'projectShow', this.updateProjectId);
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  savePhoto: function(event) {
    var photo = new LaunchAssist.Models.Photo();
    if (this.uploadedPhoto) {
      photo.set({sub_photo: this.uploadedPhoto, project_id: this.projectId});
      photo.save();
    }
  },

  handleFile: function(event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      view.uploadedPhoto = this.result;
    };
    reader.readAsDataURL(file);
  },

  updateProjectId: function(options) {
    this.projectId = options.project_id;
  }
});
