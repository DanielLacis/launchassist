LaunchAssist.Models.Photo = Backbone.Model.extend ({
  urlRoot: 'api/photos',

  toJSON: function() {
    return {photo: this.attributes};
  }
});
