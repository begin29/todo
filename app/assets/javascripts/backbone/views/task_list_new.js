$(function(){
  Todo.Lib.Backbone.Views.TaskListsNew = Backbone.View.extend({
    el: $('body'),

    initialize: function(options){
      this.$el.find(".page-header").html(JST["tasklists/new"]);
    }
  })
})