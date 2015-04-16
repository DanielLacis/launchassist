LaunchAssist.Models.Pledge = Backbone.Model.extend({
  urlRoot: 'api/pledges',

  toJSON: function() {
    return {pledge: this.attributes};
  }
});
