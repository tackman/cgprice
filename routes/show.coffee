req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
idols = require '../mylibs/idols'

redis = require 'redis'
client = redis.createClient()

exports.show = (req, res) ->
  id = idols.talbe[decodeURI(req.query.name)] if req.query.name
  if id?
    redismng.getData id, (obj) ->
      console.log 'getdata callback'
    ,(err) ->
      res.render '500', {status: 500}
  else
    res.render 'show_err', {title:'未登録のアイドル名', locals:{name: req.query.name}}


exports.list = (req,res) ->
  res.render 'show_list', {
    title: 'アイドル一覧'
    locals: {list: idols.list}
  }
