$(function(){
  Todo.Lib.Backbone.Views.TaskListsOpen = Backbone.View.extend({
    el: $('body'),

    // events: {
    //   "click btn.btn-mini.btn-info": "showTaskList"
    // },

    initialize: function(options){
      $this = this;

      // this.$el.find('h1').text(options.task_list.attributes.name.toString());

      this.$el.find("#table_head").html(JST["tasklists/_table_open"]);
      this.collection = options.collection;
      this.collection.on('reset', this.reset, this);
      // this.collection.on('remove', this.remove, this);

      this.task_list = options.task_list

      this.task_list.on('change:name', this.change_head, this);
      // this.collection.on('change', this.reset, this);
      // this.on('remove', this.remove, this);
    },

    reset: function(){
      this.$el.find("#table_body").html('');
      this.collection.each(this.renderTask, this);
    },

    // remove: function(){
    //   console.log("remove");
    // },

    change_head: function(task_list){
      this.$el.find('h1').text(task_list.attributes.name.toString());
    },

    renderTask: function(task){
      var view = new Todo.Lib.Backbone.Views.TasksView({ model: task});
      this.$el.find("#table_body").append(view.render().el);
    }

  });

  Todo.Lib.Backbone.Views.TasksView = Backbone.View.extend({
    template: JST["tasklists/show"],
    tagName: "tr",

    events: {
      "click .check": "check",
      "click .destroy": "destroy",
      "click span": "change_field",
      "focusout .hide_table_val": "submit_field"
    },

    initialize: function(e) {

      this.model.on('change', this.render, this);
      var param = $(e.target).parent().attr('name');
      
      this.model.on("invalid", function(model, error) {
        console.log(this.model.previousAttributes());

      });
    },

    check: function(e){
      e.preventDefault();

      if (this.model.get("complete")){
          this.model.set("complete", false);  
          this.$el.removeAttr("class");
      }
      else{
        this.$el.attr("class", "checked");
        this.model.set("complete", true);   
      }
      this.model.save();
    },

    change_field: function(e){
      e.preventDefault();
      $(e.target).parent().find(".hide_table_val").show().focus();
      $(e.target).hide();
    },

    submit_field: function(e){
      e.preventDefault();
      var text = $(e.target).val();

      $(e.target).hide();
      $(e.target).parent().find("span").text(text).show();
      var param = $(e.target).parent().attr('name');

      this.model.set(param, text);
      // this.model.set( {param, text}, {
      //   error: function(model, error) {
          
      //   }
      // });

      this.model.save();
    },

    render: function () {
      if(this.model.get("complete")) this.$el.addClass('checked');

      // Backbone.Validation.bind(this, {
      //   valid: function(view, attr) {
      //   },
      //   invalid: function(view, attr, error) {
      //     alert(error);
      //     // do something
      //   }
      // });
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    },

    destroy: function(e) {
      e.preventDefault();

      if(confirm("Are you sure?")){
        this.model.destroy({wait: true});
        this.$el.hide();
      } else {
        return false;
      }
      
    }

  });
});