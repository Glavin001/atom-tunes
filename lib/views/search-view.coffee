{SelectListView} = require 'atom'
TuneView = require './tune-view'

module.exports =
  class SearchView extends SelectListView

    searchThrottle: 100

    initialize: (@tuneSources) ->
      super
      @addClass('overlay from-top')

    viewForItem: (tune) ->
      return new TuneView(tune)

    confirmed: (tune) ->
      console.log("#{tune.name} was selected")

    populateList: ->

      clearTimeout(@scheduleSearch)
      @setLoading "Stop typing to search"

      searchCallback = =>
        @setLoading "Loading.."
        filterQuery = @getFilterQuery()
        console.log "populateList!", filterQuery

        @tuneSources.search filterQuery, (error, tunes) =>
          if not error?
            @items = tunes
            super
            @setLoading()

      @scheduleSearch = setTimeout(searchCallback,  @searchThrottle)

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
