req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
idols = require '../mylibs/idols'

redis = require 'redis'
client = redis.createClient()

exports.show = (req, res) ->
  req2ch.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt', (body) ->
    res.render 'debug_threads',
      {title: 'スレッド一覧', body: body}
  console.log 'get debug/threads'

exports.list = (req,res) ->
  res.render 'show_list', {
    title: 'アイドル一覧'
    locals: {list: idols.list}
  }
