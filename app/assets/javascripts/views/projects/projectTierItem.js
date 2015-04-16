LaunchAssist.Views.ProjectTierItem = Backbone.CompositeView.extend({
  template: JST['projects/project_tier_item'],
  className: 'project-tier-item',

  events: {
    'click': 'handlePledge'
  },

  initialize: function() {
    this.pledge = new LaunchAssist.Models.Pledge({id: this.model.get('is_pledged'), tier_id: this.model.get('id')})
    this.listenTo(this.pledge, 'sync', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({tier: this.model});
    if (this.pledge.get('id')) {
      this.$el.addClass('project-tier-item-pledged');
    } else {
      this.$el.removeClass('project-tier-item-pledged');
    }
    this.$el.html(content);
    return this;
  },

  handlePledge: function(event) {
    if (this.pledge.get('id')) {
      this.destroyPledge();
    } else {
      this.createPledge();
    }
  },

  destroyPledge: function() {
    this.pledge.destroy({
      success: function() {
        this.pledge.set({id: 0});
        Backbone.trigger('newPledge');
        this.model.set({numPledges: this.model.get('numPledges') - 1});
        this.render();
      }.bind(this)
    });
  },

  createPledge: function() {
    this.pledge.set({id: null})
    this.pledge.save({}, {
      success: function() {
        Backbone.trigger('newPledge');
        this.model.set({numPledges: this.model.get('numPledges') + 1});
        this.render();
      }.bind(this)
    });
  }
});
