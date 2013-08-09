$(function(){
  Todo.Lib.Backbone.Views.TaskListsIndex = Backbone.View.extend({
    el: $('body'),

    initialize: function(options){
      $this = this;
      this.$el.find("#table_head").html(JST["tasklists/_table_index"]);

      this.collection = options.collection;
      this.collection.on('reset', this.reset, this);
      this.collection.on('remove', this.reset, this);
      this.collection.on('change', this.reset, this);
      this.on('reset', this.reset, this);
      $('.page-header').append('<a class = "btn btn-success new-task-list" href= "#task_list/new">New Task list</a>');
    },

    reset: function(){
      this.$el.find("#table_body").html('');
      this.collection.each(this.renderTaskList, this);
    },

    renderTaskList: function(task_list){
      var view = new Todo.Lib.Backbone.Views.TaskListsView({ model: task_list });
      this.$el.find("#table_body").append(view.render().el);
    }

  });

  Todo.Lib.Backbone.Views.TaskListsView = Backbone.View.extend({
    template: JST["tasklists/index"],
    tagName: "tr",

    // events: {
    //   "click #destroy": "destroy",
    //   "click input[name=check]": "check"
    // },

    initialize: function() {
      this.model.on('change', this.render, this);

    },

    // check: function(e){
    //   e.preventDefault();
    //   if (this.model.get("checked")){
    //     this.model.set("checked", false);
    //   }else{
    //     this.model.set("checked", true);
    //   }
    //   this.model.save();
    // },

    render: function () {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    }

    // destroy: function(e) {
    //   e.preventDefault();
    //   this.model.destroy({wait: true});
    // }
  });
});