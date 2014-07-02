{SelectListView} = require 'atom'
TuneView = require './tune-view'

module.exports =
  class SearchView extends SelectListView
    initialize: (@playlist) ->
      super
      @addClass('overlay from-top')
      # @setItems([])

    viewForItem: (tune) ->
      return new TuneView(tune)

    confirmed: (tunes) ->
      console.log("#{tune} was selected")

    populateList: ->
      # console.log "populateList!", filterQuery
      @items = @playlist.tunes
      super

    getFilterKey: -> "name"

    open: ->
      atom.workspaceView.append(this)
      @focusFilterEditor()

    close: ->
      @detach()

    isOpen: ->
      @hasParent()

    toggle: ->
      if @isOpen()
        @close()
      else
        @open()
