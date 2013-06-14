$(function(){
  Todo.Lib.Backbone.Collections.Tasks = Backbone.Collection.extend({
    url: "/task_lists/:id/tasks",
    initialize: function (options) {
      this.model = Todo.Lib.Backbone.Models.Task;
    }
  })
});