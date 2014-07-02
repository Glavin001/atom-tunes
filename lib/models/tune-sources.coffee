Tune = require './tune'

module.exports =
  class TuneSources
    sources: []

    constructor: ->

    addSource: (source) ->

    search: (query, callback) ->
      if not query?
        return callback?(null, [])

      t = new Tune(null, {
        'name': query,
        'artist': 'USER'
        })
      console.log t
      callback?(null, [t])
