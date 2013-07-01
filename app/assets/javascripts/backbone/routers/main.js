$(function(){
  Todo.Lib.Backbone.Routers.Main = Backbone.Router.extend({

    routes: {
      "" : "index",
      "task_lists" : "index",
      "task_lists/:id/tasks" : "view_task_list"
    },

    initialize: function(){
      this.collection = new Todo.Lib.Backbone.Collections.TaskLists();
      this.collection.fetch({reset:true});
      this.indexView = new Todo.Lib.Backbone.Views.TaskListsIndex({collection: this.collection});

      this.collection = new Todo.Lib.Backbone.Collections.Tasks();
      this.collection.fetch({reset:true});
      this.showView = new Todo.Lib.Backbone.Views.TaskListsShow({collection: this.collection});

    },

    index: function() {
      this.indexView.trigger("reset");
    },

    view_task_list : function(id){
      this.showView.trigger("reset");
    }

  })
});