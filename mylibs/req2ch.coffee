http = require 'http'
Iconv = (require 'iconv').Iconv
Buffer = (require 'buffer').Buffer
iconv = new Iconv 'shift_jis', 'utf-8'

exports.threads = (req,res) ->
  console.log 'exports.threads'
  http.get {host: 'hayabusa3.2ch.net', path: '/appli/subback.html'}, (res) ->
    body = ''
    console.log 'on http get'
    res.on 'data', (data) ->
      body += data

    res.on 'end', ->
      buf = new Buffer body, 'binary'
      console.log iconv.convert buf
