req2ch = require '../mylibs/req2ch'

exports.threads = (req, res) ->
  req2ch.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt', (body) ->
    res.render 'debug_threads',
      {title: 'スレッド一覧', body: body}
  console.log 'get debug/threads'
