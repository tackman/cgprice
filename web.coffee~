express = require 'express'
app = express.createServer()
app.get '/', (req,res) ->
  res.send 'Heroku, node.js and coffee scriptでHello World!'

port = process.env.PORT || 3000
app.listen port, -> console.log "listening on " + port
