// JavaScript Document



$(function() {	
	// --------------------------------------------------------------------------------------------------------
	// Handling a login form (exposed form to public)
	// --------------------------------------------------------------------------------------------------------
	if($('#submitlogin').length > 0)
	{
		var loginForm = $('#submitlogin').parents('form').first();
		
		$('#loginusername, #loginpassword').on('keyup', function(){
			if($('#loginusername').val().length > 4 && $('#loginpassword').val().length > 4){
				$('#submitlogin').attr("type", "submit");
				$('#submitlogin').after("<input type='hidden' name='verified' id='verified' value='Y' />");
				loginForm.attr("action", getBaseURL()+"account/login");
				$('#submitlogin').removeClass('greybtn').addClass('btn');
			}
			else
			{
				$('#submitlogin').attr("type", "button");
				$('#submitlogin').remove("#verified");
				loginForm.attr("action", "");
				$('#submitlogin').removeClass('btn').addClass('greybtn');
			}
		});
	}
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling select fields
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '.selectfield', function(){
		var fieldId = $(this).attr('id');
		var listType = fieldId.split('__').pop();
		
		//Disable if editable is not set
		if(!$(this).hasClass('editable') && !$(this).hasClass('searchable')){
			$(this).attr('disabled', 'disabled');
		}
		
		//Show the options for the select field. First create the div if its not available
		if($('#'+fieldId+'__div').length > 0)
		{
			//In cases where you are coming back to the page from another page
			if($('#'+fieldId+'__div').html() == ''){
				$('#'+fieldId+'__div').width($('#'+fieldId).outerWidth());//Set its width to be the same as that of the field
				updateFieldLayer(getBaseURL()+"page/get_custom_drop_list/type/"+listType,'','',fieldId+'__div','');
			} 
			//In cases where you are just showing the same page div that you have just loaded
			else 
			{
				$('#'+fieldId+'__div').fadeIn('fast');
			}
		}
		else
		{
			$('#'+fieldId).after("<div id='"+fieldId+"__div' class='selectfielddiv'></div><input type='hidden' id='"+fieldId+"__hidden' name='"+fieldId+"__hidden' value=''>");//Add the field div and value hidden field
			$('#'+fieldId+'__div').width($('#'+fieldId).outerWidth());//Set its width to be the same as that of the field
			updateFieldLayer(getBaseURL()+"page/get_custom_drop_list/type/"+listType,'','',fieldId+'__div','');
		}
		
		//Reposition the drop down either above or below field based on its location
		var windowHeight = $(window).height();
		var divHeight = $('#'+fieldId+'__div').outerHeight();
		var fieldHeight = $('#'+fieldId).outerHeight();
		var fieldOffsetTop = $('#'+fieldId).offset().top;
		var fieldOffsetLeft = $('#'+fieldId).offset().left;
		
		if((fieldOffsetTop + fieldHeight + divHeight) > windowHeight)
		{
			var offsetTop = fieldOffsetTop - divHeight;
		} 
		else 
		{
			var offsetTop = fieldOffsetTop + fieldHeight;
		}
		
		$('#'+fieldId+'__div').offset({ top: offsetTop, left: fieldOffsetLeft });
	});
	
	
	// Handle selecting an option in the field
	$(document).on('click focus', '.selectfielddiv div', function(){
		var fieldId = $(this).parent('div').attr('id').replace(/\__div/g, '');
		
		$('#'+fieldId).removeAttr('disabled');
		$('#'+fieldId).val($(this).html());
		$('#'+fieldId).trigger('change'); // Make this look like the person has entered the stuff
		if(!$('#'+fieldId).hasClass('editable') && !$(this).hasClass('searchable'))
		{
			$(this).attr('disabled', 'disabled');
		}
		// Also fill the hidden value for the field with the real value
		$('#'+fieldId+'__hidden').val($(this).data('value'));
		$(this).parent('div').fadeOut('fast'); 
	});
	
	
	//Handle the select field loosing focus
	$(document).on('focusout', '.selectfield', function(){
		var fieldId = $(this).attr('id');
		//Close the select div list if it was not the target of the next click
		if(!$('#'+fieldId+'__div').is(":focus") && !$('#'+fieldId+'__div button').is(":focus")) 
    	{
       	 	$('#'+fieldId+'__div').fadeOut('fast');
			// Now if this is searchable clear the field if it is not among the list of selectable options
			if($(this).hasClass('searchable'))
			{
				var fieldValue = $(this).val();
				var isIn = false;
				$('#'+fieldId+'__div').children('div').each(function(){
					if($(this).data('value') == fieldValue) 
					{
						isIn = true;
						return false;
					}
				});
				//Clear
				if(!isIn) $(this).val('');
			}
    	}
	});
	
	// Handle cases where the select field is searchable
	$(document).on('keyup', '.selectfield.searchable', function(){
		var fieldId = $(this).attr('id');
		var listType = fieldId.split('__').pop();
		var searchValue = ($(this).val() != ''? '/search_by/'+replaceBadChars($(this).val()): '');
		
		updateFieldLayer(getBaseURL()+"page/get_custom_drop_list/type/"+listType+searchValue,'','',fieldId+'__div','');
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling simple form validation on the fly
	// --------------------------------------------------------------------------------------------------------
	
	//Activate form submission if the required fields are filled in
	$(document).on('change', '.simpleform input', function(e){
		var activate = true;
		var form = $(this).parents('.simpleform').first();
		form.find('input').each(function(){
			if(!$(this).hasClass('optional') && $(this).attr('type') == 'text' && $(this).val().length < 3){
				activate = false; 
				return false;
			}
		});
		
		//Now activate the form if the user has all fields filled
		var formBtn = form.find('.submitbtn').first();
		if(activate){
			formBtn.attr('onclick',"postFormFromLayer('"+form.attr('id')+"')");
			formBtn.removeClass('greybtn').addClass('btn');
		} 
		else 
		{
			formBtn.removeAttr('onclick');
			formBtn.removeClass('btn').addClass('greybtn');
		}
	});
	
	$(document).on('click', '.submitbtn', function(){
		if($(this).hasClass('greybtn')){
			showServerSideFadingMessage('Enter all required fields to continue.');
		}
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling simple form validation after submit
	// --------------------------------------------------------------------------------------------------------
	$(document).on('submit', '.simplevalidator', function(e){
		var formId = $(this).attr('id');
		var hasEmpty = "N";
		var firstEmpty = "";
		
		$(this).find('input').each(function(){
			if(!$(this).hasClass('optional') && $(this).attr('type') != 'button' && $(this).attr('type') != 'hidden' && $(this).attr('type') != 'submit' 
				&& (($(this).attr('type') == 'radio' && !$("input:radio[name='"+$(this).attr('name')+"']").is(":checked")) 
				|| ($(this).attr('type') != 'radio' && $(this).attr('type') != 'checkbox' && (
						($(this).hasClass('email') && !isValidEmail($(this).attr('id'),''))
						|| $(this).val().length < 2
				)))
			){
				//Keep track of the first field to be found empty so that you focus the user to that form
				if(hasEmpty == "N") firstEmpty = $(this).attr('id');
				if($(this).attr('type') == 'text') $(this).css('border', 'solid 3px #FFE79B');
				hasEmpty = "Y";
			}
		});
		
		//Now take the appropriate action
		if(hasEmpty == "Y"){
			showServerSideFadingMessage('Enter all required fields to continue.');
			$('#'+firstEmpty).focus();
		} else {
			return true;
		}
		
		e.preventDefault();
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling actions on permanent address being the same as the contact address
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '#permanentsameascontact', function(e){
		//Copy over the address information
		if($(this).is(':checked'))
		{
			//Remove the div if it already exists
			if($('#contactaddress__div').length > 0) $('#contactaddress__div').remove();
			//Now add the new address and its details
			var physicalOnly = $('#permanentaddress').hasClass('physical')? "/physical_only/Y": "";
			$('#contactaddress').after("<div id='contactaddress__div' class='callout'></div>");
			$('#contactaddress__div').css('min-height',(physicalOnly == ''? 265: 230)+'px');
			$('#contactaddress__div').css('min-width',$('#contactaddress').outerWidth());
			updateFieldLayer(getBaseURL()+"page/copy_address_data/from/permanentaddress/to/contactaddress/field_id/contactaddress"+physicalOnly,'','','contactaddress__div','');
			//Copy the permanent address info into the contact address field
			$('#contactaddress').val($('#permanentaddress').val());
			//Then hide the div as we do not need to show it
			$('#contactaddress__div').fadeOut('fast');
		}
		//Clear the same address information
		else
		{
			if($('#contactaddress__div').length > 0)
			{
				updateFieldLayer(getBaseURL()+"page/remove_address_data/field_id/contactaddress",'','','contactaddress__div','');
			 	$('#contactaddress__div').remove();
			}
			$('#contactaddress').val('');
		}
		
		
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Micro form functionality - picks fields in a zone with the class, submits them to a url specified in 
	// action field and shows the result in the specified results div.
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '.microform button', function(e){
		// Collect all fields to process
		var formContainer = $(this).parents('.microform').first();
		var inputs = formContainer.find('input, textarea');
		var activate = true;
		
		inputs.each(function(){
			if(!$(this).hasClass('optional') && $(this).hasClass('textfield') && $(this).val().length < 1)
			{
				activate = false; 
				return false;
			}
		});
		
		//Proceed if the required fields are all filled
		if(inputs.length > 0 && activate)
		{
			var action = formContainer.find('#action').first().val();
			var resultsDiv = formContainer.find('#resultsdiv').first().val();
			$.ajax({
        		type: "POST",
       			url: action,
      			data: inputs.serializeArray(),
      			beforeSend: function() {
           			//Do nothing
				},
      	 		success: function(data) {
		   			$("#"+resultsDiv).html(data);
					//Clear the micro form for the next entry
					inputs.each(function(){
						if($(this).attr('type') != 'hidden'){
							$(this).val('').removeAttr('checked').removeAttr('selected');
						}
					});
				}
   			});
		}
		else
		{
			showServerSideFadingMessage('Enter all required fields to continue.');
		}
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling results list table actions
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '.resultslisttable.editable .edit', function(e){	
		// 1. Get the id of the clicked item from the row
		var itemId = $(this).parents('tr').first().attr('id');
		
		// Clear color from all sibling rows and then color the row being edited
		$(this).parents('.resultslisttable').first().find('tr').each(function(){
			$(this).css('background-color', '');
		});
		$('#'+itemId).css('background-color', '#FFDF7D');
		
		// 2. Find the editing form
		var resultsDivId = $(this).parents('.resultslisttable').first().parent('div').attr('id');
		var editingFormDiv = $('.bodyspace').find('input[value="'+resultsDivId+'"]').first().parents('.microform').first().parent('div').attr('id');
		var listType = editingFormDiv.split('__').pop();
		
		// 3. Populate the editing form with the appropriate values from the session
		updateFieldLayer(getBaseURL()+"register/edit_list_item/type/"+listType+"/item_id/"+itemId,'','',editingFormDiv,'');
		
	});
	
	
	
	$(document).on('click', '.resultslisttable.editable .delete', function(e){	
		// 1. Get the id of the clicked item from the row
		var itemId = $(this).parents('tr').first().attr('id');
		
		// 2. Find the editing form
		var resultsDivId = $(this).parents('.resultslisttable').first().parent('div').attr('id');
		var editingFormDiv = $('.bodyspace').find('input[value="'+resultsDivId+'"]').first().parents('.microform').first().parent('div').attr('id');
		var listType = editingFormDiv.split('__').pop();
		
		//Ask user to confirm if they want to delete the item
		if(window.confirm('Are you sure you want to delete this '+listType+'?'))
		{
			updateFieldLayer(getBaseURL()+"register/delete_list_item/type/"+listType+"/item_id/"+itemId,'','',resultsDivId,'');
		}
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Some unique button actions
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '#backtostep1', function(e){
		document.location.href = getBaseURL()+"register/step_one";
	});
	$(document).on('click', '#editstep1', function(e){
		document.location.href = getBaseURL()+"register/step_one/action/edit_preview";
	});
	$(document).on('click', '#backtostep2', function(e){
		document.location.href = getBaseURL()+"register/step_two";
	});
	$(document).on('click', '#editstep2', function(e){
		document.location.href = getBaseURL()+"register/step_two/action/edit_preview";
	});
	$(document).on('click', '#backtostep3', function(e){
		document.location.href = getBaseURL()+"register/step_three";
	});
	$(document).on('click', '#editstep3', function(e){
		document.location.href = getBaseURL()+"register/step_three/action/edit_preview";
	});
	$(document).on('click', '#step1preview, #step2preview, #step3preview', function(e){
		// Add a field to say that we are just editing for preview
		$(this).after("<input type='hidden' id='justpreview' name='justpreview' value='Y' />");
		$(this).parents('form').first().submit();
	});
	$(document).on('click', '#step2save, #step3save', function(e){
		// Add a field to say that we are just saving the form
		$(this).after("<input type='hidden' id='justsaving' name='justsaving' value='Y' />");
		$(this).parents('form').first().submit();
	});
	$(document).on('click', '.addicon', function(e){
		document.location.href = getBaseURL()+$(this).data('url');
	});
	
	
	
	
	
	
	
	
	
	// --------------------------------------------------------------------------------------------------------
	// Handling editable content
	// --------------------------------------------------------------------------------------------------------
	$(document).on('click', '.editcontent', function(e){
		// If the edit div is hidden show them and then hide the view divs
		if(!$(this).closest('.editdiv').is(':visible')){
			$('.viewdiv').css('display', 'none');
			$('.editdiv').css('display', 'block');
			$(this).fadeOut('fast');
		}
	
	
	});
	
	
	
	
	
	
	
	
	
});	
	
	
	
	



//What to do when the form is submitted.
function postFormFromLayer(formId)
{
	// Collect all fields to process
	var inputs = $('#'+formId).find('input');
	var fieldId = formId.replace(/\__form/g, '');
	var formType = $("#"+fieldId+'__type').val();
	// Process the form data submitted
	$.ajax({
        type: "POST",
       	url: getBaseURL()+"page/get_layer_form_values/type/"+formType,
      	data: inputs.serializeArray(),
      	beforeSend: function() {
           	//Do nothing
		},
      	 success: function(data) {
		   	$("#"+fieldId+'__resultsdiv').html(data);
		}
   	});
	$('#'+fieldId+'__resultsdiv').hide('fast');
	
	//Now show what needs to be shown to the user in their field
	var fields = $("#"+fieldId+'__response_fields').val().split('|');
	var response = "";
	$.each(fields, function( index, value ){
		response += ($('#'+value).length && $('#'+value).val().length > 0)? (index > 0? ", ": "")+$('#'+value).val(): "";
	});
	
	$('#'+fieldId).val(response);
	$('#'+fieldId+'__div').fadeOut('fast');	
}






