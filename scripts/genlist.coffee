req = require './mylibs/idol_table'

console.log 'exports.list = ['

for name of req.table
  console.log '  "' + name + '"'


console.log ']'
