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

  $('.show-spaces pre').each(function() {
    addSpaces(this)
  })

  function addSpaces(node) {
    if (node.nodeType == 3) {
      var match = node.nodeValue.match(/[ \t\n]/)
      if (match) {
        var space = match.index
          , spaceNode = node.splitText(space)
          , restNode = spaceNode.splitText(1)
          , span = document.createElement('span')
        span.className = 'space'
        if (match[0] == '\t') {
          var tab = document.createElement('span')
          var tabB = document.createElement('b')
          tabB.appendChild(document.createTextNode('-------->'))
          tab.appendChild(tabB)
          span.appendChild(tab)
          span.className = 'space tab'
        } else if (match[0] == '\n') {
          spaceNode.nodeValue = '\u00AC\n'
        } else {
          spaceNode.nodeValue = '.'
        }
        spaceNode.parentNode.insertBefore(span, spaceNode)
        span.appendChild(spaceNode)
        return span
      }
    } else if (node.nodeType == 1) {
      for (var c = node.firstChild; c; c = c.nextSibling) {
        c = addSpaces(c)
      }
    }
    return node
  }

})

