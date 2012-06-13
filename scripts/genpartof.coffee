req = require './mylibs/idol_list'

console.log 'exports.partof = {'

for name in req.list
  ary = '['
  for longName in req.list
    continue if name is longName
    ary += '"' + longName + '",' if longName.indexOf(name) >= 0
  ary += ']'
  console.log '  "' + name + '": ' + ary

console.log '}'
