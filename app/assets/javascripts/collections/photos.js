LaunchAssist.Collections.Photos = Backbone.Collection.extend({
  url: 'api/projects/' + this.projectId + '/photos',
  model: LaunchAssist.Models.Photo,

  initialize: function(models, options) {
    this.projectId = options.projectId;
    this.url = 'api/projects/' + this.projectId + '/photos';
  },

  getOrFetch: function(id) {
    var photo = this.get('id');
    if (photo) {
      photo.fetch();
    } else {
      photo = new LaunchAssist.Models.Photo({id: id});
      photo.fetch({
        success: function() {
          this.add(photo);
        }.bind(this)
      });
    }
    return photo;
  }
});
