req = require './pre_table'

console.log 'exports.ids = ['

for name of req.table
  console.log '  "' + req.table[name] + '"'

console.log ']'
