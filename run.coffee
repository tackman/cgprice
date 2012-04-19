req2ch = require './mylibs/req2ch'
test = require './mylibs/test'
redismng = require './mylibs/redismng'

req2ch.threads (ary) ->
  return if ary.length <= 0
  ary.sort()
  console.log ary[0].dat
  req2ch.getDat ary[0].dat, (body, url) ->
    redismng.parse body, (result) ->
      console.log result
      console.log 'begin iteration'
      for elem of result
        console.log elem
      console.log 'end iteration'
      process.exit()
  ,(err) -> console.log 'req2ch#getDat error'
,(err) -> console.log 'req2ch#threads error'

