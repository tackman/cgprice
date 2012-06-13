itable = require './mylibs/idol_table'
ilist = require './mylibs/idol_list'
iids = require './mylibs/idol_ids'

for name in ilist.list
  exists = false
  id1 = itable.table[name]
  if !id1?
    console.log name + ' のidが存在しません'
  for id2 in iids.ids
    if id1 is id2
      exists = true
      break
  console.log 'id1:' + id1 + 'がidols.idsに存在しません' if !exists

