conString = process.env.DATABASE_URL || "tcp://postgres:qeite8bd2@localhost:5432/testdb"; 

express = require("express")
routes = require("./routes")
debug = require './routes/debug'
refresh = require './routes/refresh'
show = require './routes/show'
app = module.exports = express.createServer()

pg = require 'pg'
pg.connect conString, (err,client) ->
  console.log err?

app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "ejs"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

app.get '/debug/threads', debug.threads
app.get '/refresh', refresh.render
app.get '/list', show.list
app.get '/show', show.show

app.get "/", routes.index

port = process.env.PORT || 3000
app.listen port
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
