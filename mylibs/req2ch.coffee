http = require 'http'
Iconv = (require 'iconv-jp').Iconv
Buffer = (require 'buffer').Buffer
request = require 'request'

# スレッド一覧を取得し、配列にしてコールバックに渡す
# やっぱりついでにトレードスレの抜き出しまでやっちゃってコールバック
exports.threads = (callback) ->
  console.log 'exports.threads'
  func()
  exports.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt',
  (body) ->
    lines = body.split '\n'
    array = []
    for line in lines
      thread = line.split '<>'
      if thread[1] and thread[1].match /アイドルマスターCGトレードスレ/
        arg = {dat: thread[0]}
        array.push arg
    
    callback array

# SJISのページを取ってきてUTF-8でコールバックに渡す
exports.httpGet = (url, callback) ->
  request.get url: url, encoding: 'binary', (err, response, body) ->
    conv = new Iconv 'CP932','UTF-8'
    buf = new Buffer body, 'binary'
    body = conv.convert(buf).toString()
    callback body

func = () ->
  console.log 'hoge'
