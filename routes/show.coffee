req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
idols = require '../mylibs/idols'

redis = require 'redis'
client = redis.createClient()

exports.show = (req, res) ->
  if req.query.name
    unsp = req.query.name.split(' ').join('+')
    id = idols.table[decodeURI(unsp)]
  console.log 'id=' + id + ' unsp=' + unsp
  if id?
    redismng.getData id, (obj) ->
      res.render 'show_ok', {
        title: unsp + 'のデータ'
        locals:{data: obj, name: unsp}
      }
      console.log 'getdata callback' + obj
    ,(err) ->
      res.render '500', {status: 500}
  else
    res.render 'show_err', {title:'未登録のアイドル名', locals:{name: unsp}}


exports.list = (req,res) ->
  console.log 'show_list'
  res.render 'show_list', {
    title: 'アイドル一覧'
    locals: {list: idols.list}
  }
