$(function(){
  Todo.Lib.Backbone.Collections.Tasks = Backbone.Collection.extend({

    initialize: function (options) {
      this.model = Todo.Lib.Backbone.Models.Task;
      this.url = "/task_lists/"+options.task_list_id+"/tasks";
    }
  })
});