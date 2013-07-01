$(function(){
  Todo.Lib.Backbone.Views.TaskListsShow = Backbone.View.extend({
    el: 'div#body_document',

    // events: {
    //   "click btn.btn-mini.btn-info": "showTaskList"
    // },

    initialize: function(options){
      self = this;
      this.collection = options.collection;
      this.collection.on('reset', this.reset, this);
      this.collection.on('remove', this.reset, this);
      this.collection.on('change', this.reset, this);
      this.on('reset', this.reset, this);
    },

    // showTaskList: function(e){
    //   e.preventDefault();
    // },

    reset: function(){
      this.$el.find("#task_lists").html('');
      this.collection.each(this.renderTask, this);

    },

    renderTask: function(task){
      var view = new Todo.Lib.Backbone.Views.TasksView({ model: task});
      this.$el.find("#task_lists").append(view.render().el);
    }

  });

  Todo.Lib.Backbone.Views.TasksView = Backbone.View.extend({
    template: JST["tasklists/show"],
    tagName: "tr",

    // events: {
    //   "click #destroy": "destroy",
    //   "click input[name=check]": "check"
    // },

    initialize: function() {
      // this.model.on('change', this.render, this);
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