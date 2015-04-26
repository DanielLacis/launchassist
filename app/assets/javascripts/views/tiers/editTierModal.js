LaunchAssist.Views.EditTierModal = Backbone.View.extend({
  template: JST['tiers/edit_tier_modal'],

  events: {
    'click button#tier-edit-submit': 'submitEdits'
  },

  initialize: function(options) {
    this.$el = options.$editTierModalEl;
    this.projectId = -1;
    this.model = new LaunchAssist.Models.Tier();
    this.listenTo(Backbone, 'editTier', this.updateTierCollection);
    this.listenTo(Backbone, 'showTierEditModal', this.updateModel);
    this.render();
  },

  render: function() {
    var content = this.template({tier: this.model});
    this.$el.html(content);
    return this;
  },

  updateModel: function(options) {
    this.model = options.model;
    this.render();
  },

  submitEdits: function(event) {
    event.preventDefault();
    var tierPOJO = $('form#edit-tier-form').serializeJSON();
    if (tierPOJO.amount === "") {
      delete tierPOJO.amount;
    }
    if (tierPOJO.delivery_date === "") {
      delete tierPOJO.delivery_date;
    }
    if (tierPOJO.rewards === "") {
      delete tierPOJO.rewards;
    }
    this.model.set(tierPOJO);
    this.model.save({}, {
      success: function() {

      }.bind(this),
      error: function(model, response, options) {
        this.resp = response;
        $('div.edit-tier-errors').empty();
        _(response.responseJSON).each(function(err) {
          $('div.edit-tier-errors').append('<p>' + err + "</p>");
        });
        $('div#edit-tier-modal').on('hidden.bs.modal', function (e) {
          if (this.resp) {
            this.$('div#edit-tier-modal').modal('show');
            this.resp = null;
          }
        }.bind(this));
      }.bind(this)
    });
  }
});
