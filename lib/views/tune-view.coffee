{View} = require 'atom'

module.exports =
  class TuneView extends View
    @content: (tune) ->
      @li class: 'tune', =>
        @div class: 'status status-added icon icon-diff-added', ''
        @div class: 'primary-line icon icon-file-text', tune.name
        @div class: 'secondary-line no-icon', tune.artist

    initialize: (@tune) ->

    serialize: ->

    destroy: ->
      @detach()
