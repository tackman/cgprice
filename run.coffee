req2ch = require './mylibs/req2ch'
test = require './mylibs/test'

# req2ch.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt', (body) -> console.log body
req2ch.threads (dats) ->
  for dat in dats
    console.log dat
