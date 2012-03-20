conString = process.env.DATABASE_URL || "tcp://postgres:qeite8bd2@localhost:5432/testdb";

express = require 'express'

pg = require 'pg'
pg.connect conString, (err,client) ->
  console.log client

app = express.createServer()
app.get '/', (req,res) ->
  res.send 'Heroku, node.js and coffee scriptでHello World!'

port = process.env.PORT || 3000
app.listen port, -> console.log "listening on " + port
