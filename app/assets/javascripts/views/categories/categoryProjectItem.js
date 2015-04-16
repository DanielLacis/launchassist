LaunchAssist.Views.CategoryProjectItem = Backbone.View.extend({
  template: JST['categories/category_project_item'],
  className: 'project container',

  events: {
    'click div.project-index-image': 'sendToProject',
    'click button.project-edit': 'sendToEdit'
  },

  initialize: function(options) {
    this.currentUser = options.currentUser;
    this.listenTo(this.currentUser, 'sync', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({project: this.model, currentUser: this.currentUser});
    this.$el.html(content);
    return this;
  },

  sendToProject: function(event) {
    event.preventDefault();
    Backbone.history.navigate('#projects/' + this.model.get('id'), {trigger: true});
  },

  sendToEdit: function(event) {
    event.preventDefault();
    Backbone.history.navigate('projects/' + this.model.get('id') + '/edit', {trigger: true});
  }
});
