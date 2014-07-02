Tune = require './tune'

module.exports =
  class Playlist
    tunes: []
    constructor: ->
    addTune: (tune) ->
      @tunes.add(tune)
    removeTune: (tune) ->
      index = @tunes.indexOf(tune)
      if index > -1
        @tunes.splice(index, 1)
