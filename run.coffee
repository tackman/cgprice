req2ch = require './mylibs/req2ch'
test = require './mylibs/test'
redismng = require './mylibs/redismng'

# req2ch.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt', (boy) -> console.log body
req2ch.threads (ary) ->
  return if ary.length <= 0
  redismng.process ary
,(err) -> console.log 'req2ch#threads error'


###
ret = redismng.parseRes '非通知さん＠アプリ起動中<>sage<>2012/04/01(日) 15:04:07.90 ID:qjLO5EIQ0<> 【出】 <br> 1.5 宮本フレデリカ <br> 16  安部菜々 <br> 2.5 西園寺琴歌 <br> 3   高垣楓@6 <br> 2.5 城ヶ崎美嘉@3 <br> 1.5 諸星きらり@7 <br> 3   三好紗南 <br> 3.5 十時愛梨(Lv1)@6 <br>  <br> 【求】 <br> 左のスタドリ <br> 端数はエナドリ <br>  <br> 【ID】 <br> 61623973 <br>  <br> 無言直トレOK。よろしくお願いします。 <>'

console.log ret
###