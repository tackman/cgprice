# アイドル一覧のハッシュテーブル
# {'アイドル名': id}

# idは発音のアルファベット表記、FamilynameLastname
# 並び順はアイマスCGWiki準拠になるように頑張る
# アルファベット表記は原則カードの表記準拠
# こちらは正規表現でマッチ「後」のハッシュテーブルなので、制御文字のエスケープは不要
exports.table = {
# 1ページ
  '島村卯月': 'ShimamuraUzuki'
  '島村卯月+': 'ShimamuraUzuki+'
  '中野有香': 'NakanoYuka'
  '中野有香+': 'NakanoYuka+'
  '水本ゆかり': 'MizumotoYukari'
  '水本ゆかり+'; 'MizumotoYukari+'
  '福山舞': 'FukuyamaMai'
  '福山舞+': 'FukuyamaMai+'
  '椎名法子': 'ShinaNoriko'
  '椎名法子+': 'ShinaNoriko'
  '今井加奈': 'ImaiKana'
  '今井加奈+': 'ImaiKana+'
  '持田亜里沙': 'MochidaArisa'
  '持田亜里沙+': 'MochidaArisa+'
  '三村かな子': 'MimuraKanako'
  '三村かな子+': 'MimuraKanako+'

#2ページ
  '奥山沙織': 'OkuyamaSaori'
  '奥山沙織+': 'OkuyamaSaori+'
  '間中美里': 'ManakaMisato'
  '間中美里+': 'ManakaMisato+'
  '小日向美穂': 'KohinataMiho'
  '小日向美穂+': 'KohinataMiho+'
  '緒方智絵里': 'OgataChieri'
  '緒方智絵里+': 'OgataChieri+'
  '五十嵐響子': 'IgarashiKyoko'
  '五十嵐響子+': 'IgarashiKyoko+'
  '柳瀬美由紀': 'YanaseMiyuki'
  '柳瀬美由紀+': 'YanaseMiyuki+'
  '櫻井桃華': 'SakuraiMomoka'
  '櫻井桃華+': 'SakuraiMomoka+'
  '江上椿': 'EgamiTsubaki'
  '江上椿+': 'EgamiTsubaki+'




  ' 宮本フレデリカ': 'MiyamotoFrederica'
  ' 宮本フレデリカ+': 'MiyamotoFrederica+'
  '日下部若葉':'KusakabeWakaba'
  '日下部若葉+':'KusakabeWakaba+'
  '安部菜々':'AbeNana'
  '安部菜々+' :'AbeNana+'
  '［ふわふわスマイル］三村かな子': 'FuwafuwasmileMimuraKanako'
  'SRかな子': 'FuwafuwasmileMimuraKanako'
  '［ふわふわスマイル］三村かな子+': 'FuwafuwasmileMimuraKanako+'
  '［制服ベージュ］天海春香': 'SeifukubeigeAmamiHaruka'
  '招待春香': 'SeifukubeigeAmamiHaruka'
  '［制服グリーン］高槻やよい': 'SeifukugreenTakatsukiYayoi'
  '招待やよい': 'SeifukugreenTakatsukiYayoi'
}


# アイドル一覧
# 正規表現に突っ込んで検索するので制御文字はエスケープすること
# aliasも全部書くべし
exports.list = [
  '島村卯月'
  '島村卯月\\+'
  '中野有香':  
  '中野有香\\+'
  '水本ゆかり'
  '水本ゆかり\\+'
  '福山舞'
  '福山舞\\+'
  '椎名法子'
  '椎名法子\\+'
  '今井加奈'
  '今井加奈\\+'
  '持田亜里沙'
  '持田亜里沙\\+'
  '三村かな子'
  '三村かな子\\+'

#2ページ
  '奥山沙織'
  '奥山沙織\\+'
  '間中美里'
  '間中美里\\+'
  '小日向美穂'
  '小日向美穂\\+'
  '緒方智絵里'
  '緒方智絵里\\+'
  '五十嵐響子'
  '五十嵐響子\\+'
  '柳瀬美由紀'
  '柳瀬美由紀\\+'
  '櫻井桃華'
  '櫻井桃華\\+'
  '江上椿'                                                                                       
  '江上椿\\+'

#3ページ
  '長富蓮実'
  '長富蓮実+'
  '［バレンタイン］椎名法子'
  '［バレンタイン］椎名法子\\+'
  '横山千佳'
  '横山千佳\\+'
  '前川みく'
  '前川みく\\+'
  '赤西瑛梨華'
  '赤西瑛梨華\\+'
  '松原早耶'
  '松原早耶\\+'
  '相原雪乃'
  '相原雪乃\\+'
  ' 宮本フレデリカ'
  ' 宮本フレデリカ\\+'

# 4ページ
  '小早川紗枝'
  '小早川紗枝\\+'
  '西園寺琴歌'
  '西園寺琴歌\\+'
  '双葉杏'
  '双葉杏\\+'
  '楊菲菲'
  '楊菲菲\\+'
  '桃井あずき'
  '桃井あずき\\+'
  '涼宮星花'
  '涼宮星花\\+'
  '月宮雅'
  '月宮雅\\+'
  '兵藤レナ'
  '兵藤レナ\\+'

# 5ページ
  
  

  '日下部若葉'
  '日下部若葉\\+'
  '安部菜々'
  '安部菜々\\+'
  '［ふわふわスマイル］三村かな子'
  'SRかな子'
  '［ふわふわスマイル］三村かな子+'
  '［制服ベージュ］天海春香'
  '招待春香'
  '［制服グリーン］高槻やよい'
  '招待やよい'
]

# id一覧
exports.ids = [
  'ShimamuraUzuki'
  'MiyamotoFrederica'
  'MiyamotoFrederica+'
  'KusakabeWakaba'
  'KusakabeWakaba+'
  'AbeNana'
  'AbeNana+'
  'FuwafuwasmileMimuraKanako'
  'FuwafuwasmileMimuraKanako+'
  'SeifukubeigeAmamiHaruka'
  'SeifukugreenTakatsukiYayoi'
]
