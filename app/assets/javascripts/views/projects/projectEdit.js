LaunchAssist.Views.ProjectEdit = Backbone.View.extend ({
  template: JST['projects/project_edit'],
  className: 'project-edit container',

  events: {
    'click #project-edit-cancel': 'routeToShow',
    'change .main-photo-upload': 'handleFile',
    'click #project-edit-submit': 'projectEdit'
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add sync', this.render);
  },

  render: function() {
    var content = this.template({categories: this.collection, project: this.model});
    this.$el.html(content);
    return this;
  },

  projectEdit: function(event) {
    event.preventDefault();
    var newAttrs = this.$('form#edit-project').serializeJSON();
    if (newAttrs.end_date === '') {
      delete newAttrs['end_date'];
    }
    if (this.uploadedPhoto) {
      this.model.set({main_photo: this.uploadedPhoto});
    }
    this.model.set(newAttrs);
    this.model.save({}, {
      success: function() {
        Backbone.history.navigate('projects/' + this.model.get('id'), {trigger: true});
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
  },

  routeToShow: function(event) {
    Backbone.history.navigate('projects/' + this.model.get('id'), {trigger: true});
  }

});
