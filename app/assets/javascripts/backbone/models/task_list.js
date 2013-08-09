$(function(){
  Todo.Lib.Backbone.Models.TaskList = Backbone.Model.extend({
    initialize: function (options) {
      if (options.url) this.url = options.url;
    }
  });
});