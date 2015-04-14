LaunchAssist.Views.newProjectModal = Backbone.View.extend({
  template: JST['nav/modal'],

  events: {
    'change .main-photo-upload': 'handleFile',
    'click #project-submit': 'newProject'
  },

  initialize: function(options) {
    this.$el = options.$modalEl;
    this.uploadedPhoto = null;
    this.listenTo(this.collection, 'add sync', this.render);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({collection: this.collection, model: this.model});
    this.$el.html(content);
    return this;
  },

  newProject: function(event) {
    
    event.preventDefault();
    var newProjectPOJO = this.$('form#new-project').serializeJSON();
    var newProject = new LaunchAssist.Models.Project();
    newProject.set(newProjectPOJO);
    newProject.set({main_photo: this.uploadedPhoto});
    newProject.save({}, {
      success: function() {
        Backbone.history.navigate('#projects/' + newProject.get('id'), {trigger: true});
      }.bind(this)
    });
  },

  handleFile: function(event) {

    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      view.uploadedPhoto = this.result;
    };
    reader.readAsDataURL(file);
  }
});
