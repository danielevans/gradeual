$(document).ready(function() {
  /* default functionality */
  /*
     var myCodeMirror = CodeMirror($('.editor')[0], {
       autofocus: true,
       lineNumbers: true,
       mode: "python"
     });
 */

  if ($('.edit').size() > 0) {
    $('.edit').each(function() {
      CodeMirror.fromTextArea(this, {
        autofocus: true,
        lineNumbers: true,
        mode: "python"
      });
    });
  }

  if ($('.view').size() > 0) {
    $('.view').each(function() {
      CodeMirror.fromTextArea(this, {
        lineNumbers: true,
        mode: "python",
        readOnly: "nocursor"
      });
    });
  }
});
