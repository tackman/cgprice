req2ch = require '../mylibs/req2ch'
redismng = require '../mylibs/redismng'
redis = require 'redis'

if process.env.REDISTOGO_URL
  rtg   = require("url").parse(process.env.REDISTOGO_URL)
  client = redis.createClient(rtg.port, rtg.hostname)
  client.auth(rtg.auth.split(":")[1])
else
  client = redis.createClient()

exports.render = (req, res) ->
  console.log 'GET /refresh'
  client.get 'updateTime', (err, ret) ->
    now = new Date()
    millis = now.getTime()
    if ret? and millis - ret < 36     # 本番では1時間
      res.render 'refresh', {
        title: '更新 - 時間制限中'
        body: 'データの更新は1時間に1回です。あと' + (3600000 - (millis - ret))/1000 + '秒お待ちください。'
      }
    else
      res.render 'refresh', {
        title: '更新中…'
        body: 'データの更新を開始しました。しばらく待ってから確認してください。'
      }
      client.set 'updateTime', millis, redis.print
      refresh()



refresh = () ->
  req2ch.threads (ary) ->
    return if ary.length <= 0
    ary.sort()
    req2ch.getDat ary[0].dat, (body, url) ->
      redismng.parse body
      client.set 'updateThread', ary[0].dat, redis.print
    ,(err) -> console.log 'req2ch#getDat error'
  ,(err) -> console.log 'req2ch#threads error'
