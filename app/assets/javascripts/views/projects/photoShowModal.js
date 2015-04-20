LaunchAssist.Views.PhotoShowModal = Backbone.View.extend({
  template: JST['projects/photo_show_modal'],

  events: {
    'click button#photo-delete': 'destroyPhoto'
  },

  initialize: function(options) {
    this.$el = options.$photoShowModalEl;
    this.isOwner = options.isOwner;
    this.listenTo(Backbone, 'showPhotoModal', this.updatePhoto);
  },

  render: function() {
    var content = this.template({photo: this.model, isOwner: this.isOwner});
    this.$el.html(content);
    return this;
  },

  destroyPhoto: function(event) {
    event.preventDefault();
    this.model.destroy({
      success: function() {
        Backbone.trigger('destroyedPhoto', this.model);
      }.bind(this)
    });
  },

  updatePhoto: function(options) {
    if (this.model) {
      this.stopListening(this.model);
    }
    this.model = options.photo;
    this.isOwner = options.isOwner;
    this.listenTo(this.model, 'sync', this.render);
    this.render();
    this.$('div#show-photo').modal('toggle');
  }
});
