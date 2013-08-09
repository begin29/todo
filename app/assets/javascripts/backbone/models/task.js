$(function(){
  Todo.Lib.Backbone.Models.Task = Backbone.Model.extend({
  	validate: function() {
  		if( this.get("progress") > 100 ) return "Must less or equal than 100";
  	}
  });
});