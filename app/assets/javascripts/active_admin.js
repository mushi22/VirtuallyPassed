//= require active_admin/base
//= require tinymce

$(document).ready(function() {
  tinyMCE.init({
     mode: 'textareas',
     theme: "modern",
	 editor_selector : "tinymce",
	 plugins : 'advlist autolink link image lists charmap print preview'
   });
});