$(function(){
  Todo.Lib.Backbone.Collections.TaskLists = Backbone.Collection.extend({
    url: "/task_lists",
    initialize: function (options) {
      this.model = Todo.Lib.Backbone.Models.TaskList;
    }
  })
});