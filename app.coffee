express = require("express")
routes = require("./routes")
refresh = require './routes/refresh'
show = require './routes/show'
app = module.exports = express.createServer()


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

# app.get '/refresh', refresh.render
app.get '/list', show.list
app.get '/show', show.show

app.get "/", routes.index

app.use (req,res,next) ->
  res.render '404',{
    title: 'page not found'
    status: 404
  }

port = process.env.PORT || 3000
app.listen port
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
