idols = require './mylibs/idols'

for name in idols.list
  exists = false
  id1 = idols.table[name]
  if !id1?
    console.log name + ' のidが存在しません'
  for id2 in idols.ids
    if id1 is id2
      exists = true
      break
  console.log 'id1:' + id1 + 'がidols.idsに存在しません' if !exists

