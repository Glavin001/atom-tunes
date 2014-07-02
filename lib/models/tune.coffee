module.exports =
  class Tune
    constructor: (@tuneSource, @meta) ->
      @name = @meta.name
      @artist = @meta.artist
    name: null
    artist: null
