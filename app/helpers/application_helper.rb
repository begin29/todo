module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  direction = column == sort_column(column) && sort_direction == "sort_asc" ? "sort_desc" : "sort_asc"
	  link_to title, {:"#{direction}" => column}
	end


  def sort_column(column)
  	TaskList.column_names.include?(column) ? column  : "id" 
  end

  def sort_direction
  	regular = /^(sort)/
  	# par = params.each {|p| regular =~ p.to_s }
  	# дописати 
  	par = params.each do {|k,v| regular =~ k.to_s  } 
  	puts '='*50
  	puts par
    %w[sort_asc sort_desc].include?(params[:sort_asc]) ? "sort_asc" : "sort_desc"
  end


end
