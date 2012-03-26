http = require 'http'
Iconv = (require 'iconv-jp').Iconv
Buffer = (require 'buffer').Buffer
request = require 'request'

exports.threads = (req,res) ->
  console.log 'exports.threads'

  request.get url: 'http://hayabusa3.2ch.net/appli/subback.html', encoding: 'binary', (err, response, body) ->
    conv = new Iconv 'CP932','UTF-8'
    buf = new Buffer body, 'binary'
    body = conv.convert(buf).toString()
    console.log body

