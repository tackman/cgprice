req2ch = require '../mylibs/req2ch'

exports.threads = (req, res) ->
  req2ch.threads()
  console.log 'get debug/threads'
  res.render "index",
    title: "deubg.coffee#threads"
