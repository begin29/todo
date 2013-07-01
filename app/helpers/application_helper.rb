module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  direction = column == sort_column && sort_direction == "sort_asc" ? "sort_desc" : "sort_asc"
	  link_to title, {:"#{direction}" => column}
	end

  def sort_column
    par = regular_find
    par["#{par.keys[0]}"]
  end

  def sort_direction
  	par = regular_find
    %w[sort_asc sort_desc].include?(par.keys[0]) ? par.keys[0] : "sort_asc"
  end

  def regular_find
    regular = /^(sort)/
    params.select {|k,v| regular =~ k.to_s }
  end


end
