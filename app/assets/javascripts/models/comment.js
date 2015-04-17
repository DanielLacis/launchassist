LaunchAssist.Models.Comment = Backbone.Model.extend({
  urlRoot: 'api/comments',

  parse: function(response) {
    if (response.user) {
      this.user = this.user || {};
      this.user.username = response.user.username;
      this.user.user_id = response.user.id;
      delete response.user;
    }
    return response;
  },

  username: function() {
    return _.escape(this.user.username);
  },

  user_id: function() {
    return _.escape(this.user.user_id);
  }
});
