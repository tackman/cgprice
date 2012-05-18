req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
idols = require '../mylibs/idols'

redis = require 'redis'
client = redis.createClient()

exports.show = (req, res) ->
  id = idols.table[decodeURI(req.query.name)] if req.query.name
  console.log 'id=' + id
  if id?
    redismng.getData id, (obj) ->
      res.render 'show_ok', {
        title: req.query.name + 'のデータ'
        locals:{data: obj}
      }
      console.log 'getdata callback' + obj
    ,(err) ->
      res.render '500', {status: 500}
  else
    res.render 'show_err', {title:'未登録のアイドル名', locals:{name: req.query.name}}


exports.list = (req,res) ->
  res.render 'show_list', {
    title: 'アイドル一覧'
    locals: {list: idols.list}
  }
