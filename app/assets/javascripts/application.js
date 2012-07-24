// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require codemirror
//= require codemirror/clike
//= require codemirror/util/searchcursor
//= require codemirror/util/match-highlighter
//= require_tree .
//= require ckeditor/init
/*global CodeMirror*/
$(function() {

  $('textarea.codemirror').each(function() {
    var highlightLine
    var editor = CodeMirror.fromTextArea(this, {
      lineNumbers: true
    , matchBrackets: true
    , mode: "text/x-csharp"
    , theme: "dtinth256"
    , indentUnit: 4
    , lineWrapping: true
    , onCursorActivity: function() {
        if (highlightLine) editor.setLineClass(highlightLine, null, null)
        highlightLine = editor.setLineClass(editor.getCursor().line, null, 'active-line')
        editor.matchHighlight("CodeMirror-matchhighlight")
      }
    })
    $(this).data('editor', editor)
  })

})

