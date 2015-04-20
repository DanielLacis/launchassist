LaunchAssist.Views.ProjectShow = Backbone.CompositeView.extend({
  template: JST['projects/project_show'],
  className: 'project-show container',
  events: {
    'click button.project-edit': 'sendToEdit',
    'click button#new-comment-submit': 'createComment',
    'click button#edit-tiers': 'sendToEditTiers'
  },

  initialize: function(options) {
    this.comments = options.comments;
    this.photos = options.photos;
    this.collection.each( function(tier) {
      this.addTierView(tier);
    }.bind(this));
    this.comments.each( function(comment) {
      this.addCommentView(comment);
    }.bind(this));
    this.photos.each( function(photo) {
      this.addPhotoView(photo);
    }.bind(this));
    this.currentUser = options.currentUser;
    this.listenTo(this.photos, 'add', this.addPhotoView);
    this.listenTo(this.comments, 'add', this.addCommentView);
    this.listenTo(this.collection, 'add', this.addTierView);
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.currentUser, 'sync', this.render);
    this.listenTo(this.model, 'sync', function (model) {
      Backbone.trigger('setActiveTab', { title: model.get('category').title, url: '#/categories/' + model.get('category_id') });
    });
    this.listenTo(Backbone, 'deletedComment', this.removeCommentView);
    this.listenTo(Backbone, 'newPledge', this.updateModel);
    this.listenTo(Backbone, 'addedPhoto', this.updatePhotos);
    this.listenTo(Backbone, 'destroyedPhoto', this.destroyedPhoto);
    if (this.currentUser.get('id') == this.model.get('user_id')) {
      this.isOwner = true;
    } else {
      this.isOwner = false;
    }
  },

  render: function() {
    if (this.currentUser.get('id') == this.model.get('user_id')) {
      this.isOwner = true;
    } else {
      this.isOwner = false;
    }
    var content = this.template({project: this.model, currentUser: this.currentUser, isOwner: this.isOwner});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTierView: function(inputTier) {
    var newView = new LaunchAssist.Views.ProjectTierItem({model: inputTier});
    this.addSubview('div.project-tiers', newView);
  },

  addCommentView: function(inputComment) {

    var newView = new LaunchAssist.Views.ProjectCommentItem({model: inputComment, currentUser: this.currentUser});
    this.addSubview('div.project-comments', newView);
  },

  addPhotoView: function(inputPhoto) {
    var newView = new LaunchAssist.Views.PhotoViewItem({model: inputPhoto, currentUser: this.currentUser, isOwner: this.isOwner});
    this.addSubview('div.project-photos', newView);
  },

  removeCommentView: function(commentView) {
    this.removeSubview('div.project-comments', commentView);
    this.render();
  },

  sendToEdit: function(event) {
    event.preventDefault();
    Backbone.history.navigate('projects/' + this.model.get('id') + '/edit', {trigger: true});
  },

  sendToEditTiers: function(event) {

    event.preventDefault();
    Backbone.history.navigate('projects/' + this.model.get('id') + '/tiers/edit', {trigger: true});
  },

  updateModel: function() {
    this.model.fetch();
  },

  createComment: function(event) {
    var body = this.$('textarea.new-comment-body').val();
    this.$('textarea.new-comment-body').val('');
    var comment = new LaunchAssist.Models.Comment();
    comment.set({project_id: this.model.get('id'), body: body});
    comment.save({}, {
      success: function() {
        this.comments.add(comment, {silent: true});
        this.createNewCommentView(comment);
      }.bind(this)
    });
  },

  createNewCommentView: function(comment) {
    var newView = new LaunchAssist.Views.ProjectCommentItem({model: comment, currentUser: this.currentUser});
    this.addPrependSubview('div.project-comments', newView);
  },

  updatePhotos: function(options) {
    var photo = options.photo;
    if (photo.get('project_id') == this.model.get('id')) {
      this.photos.add(photo, {silent: true});
      this.createNewPhotoView(photo);
    }
  },

  createNewPhotoView: function(photo) {
    var newView = new LaunchAssist.Views.PhotoViewItem({model: photo, currentUser: this.currentUser, isOwner: this.isOwner});
    this.addPrependSubview('div.project-photos', newView);
  },

  destroyedPhoto: function(photo) {
    var photoSubview = this.findPhotoSubview(photo);
    this.removeSubview('div.project-photos', photoSubview);
  },

  findPhotoSubview: function(photo) {
    var photoSubview;
    var subs = this.subviews('div.project-photos');
    _(subs).each(function(sub) {
      if (sub.model === photo) {
        photoSubview = sub;
      }
    }.bind(this));
    return photoSubview;
  }

});
