http = require 'http'
Iconv = (require 'iconv-jp').Iconv
Buffer = (require 'buffer').Buffer
request = require 'request'

# スレッド一覧を取得し、配列にしてコールバックに渡す
# やっぱりついでにトレードスレの抜き出しまでやっちゃってコールバック
exports.threads = (callback,err_cb) ->
  exports.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt',
  (body) ->
    lines = body.split '\n'
    array = []
    for line in lines
      thread = line.split '<>'
      if thread[1] and thread[1].match /アイドルマスターCGトレードスレ/
        arg = {dat: thread[0], name: thread[1]}
        array.push arg
    callback array
  ,err_cb

exports.getDat = (dat, callback, err_cb) ->
  url = 'http://hayabusa3.2ch.net/appli/dat/' + dat
  exports.httpGet url, callback, err_cb

# SJISのページを取ってきてUTF-8でコールバックに渡す
exports.httpGet = (url, callback, err_cb) ->
  console.log 'httpGet url=' + url
  request.get url: url, encoding: 'binary', (err, response, body) ->
    if err?
      err_cb err
      return
    conv = new Iconv 'CP932','UTF-8'
    buf = new Buffer body, 'binary'
    console.log 'try to convert ' + url

    try
      body = conv.convert(buf).toString()
      callback body,url
    catch error
      console.log error

func = () ->
  console.log 'hoge'
