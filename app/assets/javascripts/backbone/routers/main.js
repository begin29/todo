$(function(){
  Todo.Lib.Backbone.Routers.Main = Backbone.Router.extend({

    routes: {
      "" : "index",
      "task_lists" : "index",
      "task_lists/:id" : "view_task_list",
      "task_lists/new" : "new_task_list"
    },

    initialize: function(){
    
    },

    index: function() {
      this.collection = new Todo.Lib.Backbone.Collections.TaskLists();
      this.collection.fetch({reset:true});
      this.indexView = new Todo.Lib.Backbone.Views.TaskListsIndex({collection: this.collection});
      this.indexView.trigger("reset");
    },

    view_task_list : function(id){
      this.task_list = new Todo.Lib.Backbone.Models.TaskList({ url: "/task_lists/"+id });
      this.task_list.fetch();

      this.collection = new Todo.Lib.Backbone.Collections.Tasks({task_list_id: id});
      this.collection.fetch({reset:true});

      this.showView = new Todo.Lib.Backbone.Views.TaskListsOpen({collection: this.collection, task_list: this.task_list});
      this.showView.trigger("reset");
    }, 

    new_task_list : function(){
      this.newView = new Todo.Lib.Backbone.Views.TaskListsNew();
      this.newView.trigger("reset");
    }
  })
});