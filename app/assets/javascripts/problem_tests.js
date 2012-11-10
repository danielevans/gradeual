// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
Numerous.init({
  'problemtest': {
    'add': function(form) {
      CodeMirror.fromTextArea($(form).find('.edit')[0], {
          autofocus: true,
          lineNumbers: true,
          mode: "python"
      });
    }
  }
});
