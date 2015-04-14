LaunchAssist.Views.CategoryProjectItem = Backbone.View.extend({
  template: JST['categories/category_project_item'],
  className: 'project container',

  events: {
    'click img.category-image-index': 'sendToProject',
    'mouseover img.category-image-index': 'changeCursor'
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
