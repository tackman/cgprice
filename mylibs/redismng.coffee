ilist = require './idol_list'
itable = require './idol_table'
req2ch = require './req2ch'
redis = require 'redis'


if process.env.REDISTOGO_URL
  rtg   = require("url").parse(process.env.REDISTOGO_URL)
  client = redis.createClient(rtg.port, rtg.hostname)
  client.auth(rtg.auth.split(":")[1])
else
  client = redis.createClient()




client.on "error", (err) ->
  console.log 'redis error:' + err

exports.getData = (key, callback, onerr) ->
  client.get key, (err,data) ->
    return onerr(err) if err?
    obj = JSON.parse data
    callback obj


# datを解釈して結果をDBに格納・Redis版
# うまくいかなかったらPSQL版が書かれることになる

exports.process = (threads) ->
  for thread in threads
    req2ch.getDat thread.dat, (body,url) ->
      result = exports.parse body
    ,(err) -> console.log 'error at req2ch.getDat'

# 1つのdatに対して[{'id':'price'}, ...] の配列を返す
# やっぱりDB追加までここでやる
exports.parse = (dat, callback) ->
  ret = []
  reses = dat.split '\n'
  count = 0
  for res in reses
    results = exports.parseRes res
    if results?
      for result in results
        ret.push result
    count++


  _ret = insertDb ret
  callback _ret if callback?
  return _ret

insertDb = (ary) ->
  toInsert = {}
  for obj in ary
    unless toInsert[obj.id]?
      toInsert[obj.id] = {}
    price_n = parseFloat(obj.price)
    unless (toInsert[obj.id])[price_n]?
      (toInsert[obj.id])[price_n] = 0
    (toInsert[obj.id])[price_n] += 1


  for key of toInsert
    client.set key, JSON.stringify(toInsert[key]) #, redis.print

  return toInsert


# １つのレスを処理
# returns: [{'id': 'price'}, ...]
exports.parseRes = (res) ->
  ret = []
  elems = res.split '<>'
  return null if res.length < 4
  # elems[0] 名前
  # elems[1] mail
  # elems[2] date, id
  # elems[3] body
  list = ilist.list
  table = itable.table
  for name in list
    price = exports.parseBody elems[3],name
    if price?
      id = table[name]
      toPush = new Object()
      toPush.id = id
      toPush.price = price
      ret.push toPush

  return ret


# 本文に対して、nameのアイドルを探してパース
# 戻り値は価格
exports.parseBody = (body, name) ->
  escaped = name.split('+').join('\\+')
  reg1 = new RegExp '(' + escaped + ')[^0-9]?[^0-9]*([0-9]+\\.?[0-9]*)'
  reg2 = new RegExp '([0-9]+\\.?[0-9]*).*(' + escaped + ')'
  nameplus = name + '+'

  tmp = body.split('[').join('［')
  zen_body = tmp.split(']').join('］')

  lines = zen_body.split '<br>'
  for line in lines
    if line.indexOf(name) == -1
      continue
    else if line.indexOf(nameplus) >= 0
      continue
    if line.match(reg1) and line.match(reg2)
      continue
    else if line.match reg1
      return RegExp.$2
    else if line.match reg2
      return RegExp.$1
  return null
