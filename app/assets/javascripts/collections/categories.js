LaunchAssist.Collections.Categories = Backbone.Collection.extend({
  url: 'api/categories',
  model: LaunchAssist.Models.Category,


  getOrFetch: function(id) {
    var category = this.get(id);
    if (category) {
      category.fetch();
    } else {
      category = new LaunchAssist.Models.Category({id: id});
      category.fetch({
        success: function() {
          this.add(category);
        }.bind(this)
      });
    }
    return category;
  }
});
