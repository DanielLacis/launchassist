LaunchAssist.Views.ProjectShow = Backbone.CompositeView.extend({
  template: JST['projects/project_show'],
  className: 'project-show container',
  events: {
    'click button.project-edit': 'sendToEdit'
  },

  initialize: function(options) {
    this.collection.each( function(tier) {
      this.addTierView(tier);
    }.bind(this));
    this.currentUser = options.currentUser;
    this.listenTo(this.collection, 'add', this.addTierView);
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.currentUser, 'sync', this.render);
    this.listenTo(this.model, 'sync', function (model) {
      Backbone.trigger('setActiveTab', { title: model.get('category').title, url: '#/categories/' + model.get('category_id') });
    });
    this.listenTo(Backbone, 'newPledge', this.updateModel);
  },

  render: function() {
    var content = this.template({project: this.model, currentUser: this.currentUser});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTierView: function(inputTier) {
    var newView = new LaunchAssist.Views.ProjectTierItem({model: inputTier});
    this.addSubview('div.project-tiers', newView);
  },

  sendToEdit: function(event) {
    event.preventDefault();
    Backbone.history.navigate('projects/' + this.model.get('id') + '/edit', {trigger: true});
  },

  updateModel: function() {
    this.model.fetch();
  }



});
