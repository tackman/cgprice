req2ch = require './mylibs/req2ch'
test = require './mylibs/test'
redismng = require './mylibs/redismng'

ret = redismng.parseBody '[純粋奏者] 123', '［純粋奏者］'
console.log ret

process.exit()
