req2ch = require './mylibs/req2ch'
test = require './mylibs/test'
redismng = require './mylibs/redismng'

ret = redismng.parseBody '[パワフル双子姉]双海真美183 ', '［パワフル双子姉］双海真美'
console.log ret

ret2 = redismng.parseBody '[パワフル双子姉］双海真美[195] ', '［パワフル双子姉］双海真美'
console.log ret2

ret3 = redismng.parseBody '(500)[パワフル双子姉]双海真美 MM特訓LvMAX特技 ', '［パワフル双子姉］双海真美'
console.log ret3

process.exit()
