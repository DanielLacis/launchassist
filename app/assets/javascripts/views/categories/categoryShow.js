LaunchAssist.Views.CategoryShow = Backbone.CompositeView.extend({
  template: JST['categories/category_show'],
  className: 'category-main container',

  initialize: function() {
    this.model.projects().each(function(project) {
      if (project.isNew()) {
      } else {
        this.addToProjects(project);
      }
    }.bind(this));
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.projects(), 'sync', this.render);
    this.listenTo(this.model.projects(), 'add', this.addToProjects);
  },
  render: function() {
    var content = this.template({category: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addToProjects: function(inputModel) {
    var subview = new LaunchAssist.Views.CategoryProjectItem({model: inputModel});
    this.addSubview('div.projects', subview);
  }
});
