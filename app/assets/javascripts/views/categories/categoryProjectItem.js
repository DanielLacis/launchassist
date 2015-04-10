LaunchAssist.Views.CategoryProjectItem = Backbone.View.extend({
  template: JST['categories/category_project_item'],
  className: 'project container',

  events: {
    'click img.show-image': 'sendToProject',
    'mouseover img.show-image': 'changeCursor'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({project: this.model});
    this.$el.html(content);
    return this;
  },

  sendToProject: function(event) {
    event.preventDefault();
    Backbone.history.navigate('#projects/' + this.model.get('id'), {trigger: true});
  },

  changeCursor: function(event) {
    event.preventDefault();
    $(event.currentTarget).css('cursor', 'pointer');
  }
});
