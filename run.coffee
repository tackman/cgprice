req2ch = require './mylibs/req2ch'
test = require './mylibs/test'
redismng = require './mylibs/redismng'

# req2ch.httpGet 'http://hayabusa3.2ch.net/appli/subject.txt', (body) -> console.log body
console.log redismng.parseBody('【出】 <br> 1 輿水幸子 小早川紗枝 <br> 2 宮本ﾌﾚﾃﾞﾘｶ <br> 3.5 高垣楓 <br> 5 招待やよい <br> 8 白坂小梅 <br> 【求】 <br> 左のスタドリ 端数は7万ﾏﾆｰorｴﾅﾄﾞﾘ <br>  <br> ID2231524 <br> 無言直トレでokです。', '招待やよい')

