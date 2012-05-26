req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
idols = require '../mylibs/idols'

redis = require 'redis'

if process.env.REDISTOGO_URL
  rtg   = require("url").parse(process.env.REDISTOGO_URL)
  client = redis.createClient(rtg.port, rtg.hostname)
  client.auth(rtg.auth.split(":")[1])
else
  client = redis.createClient()

exports.show = (req, res) ->
  if req.query.name
    unsp = req.query.name.split(' ').join('+')
    id = idols.table[decodeURI(unsp)]

  if id?
    redismng.getData id, (obj) ->
      res.render 'show_ok', {
        title: unsp + 'のデータ'
        locals:{data: obj, name: unsp}
      }

    ,(err) ->
      res.render '500', {status: 500}
  else
    res.render 'show_err', {title:'未登録のアイドル名', locals:{name: unsp}}


exports.list = (req,res) ->
  res.render 'show_list', {
    title: 'アイドル一覧'
    locals: {list: idols.list}
  }
