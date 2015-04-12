LaunchAssist.Views.ProjectShow = Backbone.CompositeView.extend({
  template: JST['projects/project_show'],
  className: 'project-show container',
  initialize: function() {
    this.collection.each( function(tier) {
      this.addTierView(tier);
    }.bind(this));
    this.listenTo(this.collection, 'add', this.addTierView);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({project: this.model}); // template will not need arguments
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTierView: function(inputTier) {
    var newView = new LaunchAssist.Views.ProjectTierItem({model: inputTier});
    this.addSubview('div.project-tiers', newView);
  }

});
