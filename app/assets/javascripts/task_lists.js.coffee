# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$(window).scroll ->
		url = jQuery('.pagination .next_page').attr('href')
		if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
			$('.pagination').text("Waiting for more...")
			$.getScript(url)
	
	$("input[type=checkbox]").on 'click', ->
		address = 'http://'+window.location.host+"/task_lists/complete_check"
		if $(this).closest("tr").attr("class") == "checked"
			flag = false
		else
			flag = true

		$.post address,
		task_id: $(this).val()
		type_check: flag
		success: (data, textStatus, jqXHR) ->
			
		
		