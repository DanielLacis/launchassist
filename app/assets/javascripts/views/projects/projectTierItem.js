LaunchAssist.Views.ProjectTierItem = Backbone.CompositeView.extend({
  template: JST['projects/project_tier_item'],
  className: 'project-tier-item',
  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({tier: this.model});
    if (this.model.get('is_pledged')) {
      this.$el.addClass('project-tier-item-pledged');
    } else {
      this.$el.removeClass('project-tier-item-pledged');
    }
    this.$el.html(content);
    return this;
  }
});
