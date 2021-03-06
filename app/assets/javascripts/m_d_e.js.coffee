#= require 'marked'
#= require 'ace/ace'
#= require 'ace/worker-html'
#= require 'ace/theme-solarized_dark'
#= require 'ace/mode-markdown'
#= require 'ace/keybinding-vim'
#= require 'ace/keybinding-emacs'
#
class window.Editor
  constructor: (input_field) ->
    @input_field = input_field
    $("##{@input_field}").css('visibility', 'hidden')
    @theme_prefix = 'ace/theme/'
    @ttimer = null
    @aedit = ace.edit('mde_editor')
    @aedit.setValue($("##{@input_field}").val())
    mdm = require('ace/mode/markdown').Mode
    @aedit.getSession().setMode(new mdm())

    $('#mde_preview').html(marked @aedit.getValue() )

    @aedit.getSession().on 'change', this._change.bind(this)
    @aedit.getSession().on 'changeScrollTop', this._syncScrolls.bind(this)

    window.editor = this

  _change: (e)=>
    clearTimeout(@ttimer) if @ttimer
    @ttimer = window.setTimeout(() ->
      $('#mde_preview').html(marked editor.aedit.getValue())
      true
    , 1000)
    $("##{@input_field}").val(editor.aedit.getValue())
    true

  setTheme: (name) =>
    @aedit.setTheme @theme_prefix + name

  setViMode: =>
    @aedit.setKeyboardHandler('ace/keyboard/vim')

  setEmacsMode: =>
    @aedit.setKeyboardHandler('ace/keyboard/emacs')

  _syncScrolls: (val) ->
      fs = parseInt $('#mde_editor').css('font-size')
      $('#mde_preview').scrollTop(val * fs)
