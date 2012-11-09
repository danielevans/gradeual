$(document).ready(function() {
  /* default functionality */
  /*
     var myCodeMirror = CodeMirror($('.editor')[0], {
     autofocus: true,
     lineNumbers: true,
     mode: "python"
     });
     */

  console.log('1');
  if ($('#problem_template_code')[0] != undefined) {
    var problemTemplateCode = CodeMirror.fromTextArea($('#problem_template_code')[0], {
      autofocus: true,
      lineNumbers: true,
      mode: "python"
    });

    console.log('2');
    var problemReferenceCode = CodeMirror.fromTextArea($('#problem_reference_code')[0], {
      autofocus: true,
        lineNumbers: true,
        mode: "python"
    });
  }

  if ($('#view_problem_template_code')[0] != undefined) {

    console.log('3');
    var viewProblemTemplateCode = CodeMirror.fromTextArea($('#view_problem_template_code')[0], {
      lineNumbers: true,
      mode: "python",
      readOnly: "nocursor"
    });

    console.log('4');
    var viewProblemReferenceCode = CodeMirror.fromTextArea($('#view_problem_reference_code')[0], {
      lineNumbers: true,
      mode: "python",
      readOnly: "nocursor"
    });
  }
});
