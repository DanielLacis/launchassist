LaunchAssist.Views.CategoryProjectItem = Backbone.View.extend({
  template: JST['categories/category_project_item'],
  className: 'project',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({project: this.model});
    this.$el.html(content);
    return this;
  }
});
