idols = require './idols'
redis = require 'redis'
client = redis.createClient()

client.on "error", (err) ->
  console.log 'redis error:' + err

# datを解釈して結果をDBに格納・Redis版
# うまくいかなかったらPSQL版が書かれることになる

exports.process = (dats) ->
  for dat in dats
    exports.parse dat

# 1つのdatに対して[{'id':'price'}, ...] の配列を返す
exports.parse = (dat) ->
  reses = dat.split '\n'

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
  list = idols.list
  table = idols.table
  for name in list
    price = exports.parseBody elems[3],name
    if price?
      id = table[name]
      toPush = new Object()
      toPush[id] = price
      ret.push toPush

  return ret


# 本文に対して、nameのアイドルを探してパース    
# 戻り値は価格
exports.parseBody = (body, name) ->
  reg1 = new RegExp '(' + name + ').*([0-9]+\\.?[0-9]*)'
  reg2 = new RegExp '([0-9]+\\.?[0-9]*).*(' + name + ')'

  lines = body.split '<br>'
  for line in lines
    if line.match(reg1) and line.match(reg2)
      continue
    else if line.match reg1
      return RegExp.$2
    else if line.match reg2
      console.log 'matched type2'
      return RegExp.$1

  return null
