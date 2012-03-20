(function() {
  var app, conString, express, pg, port;

  conString = process.env.DATABASE_URL || "tcp://postgres:qeite8bd2@localhost:5432/testdb";

  express = require('express');

  pg = require('pg');

  pg.connect(conString, function(err, client) {
    return console.log(client);
  });

  app = express.createServer();

  app.get('/', function(req, res) {
    return res.send('Heroku, node.js and coffee scriptでHello World!');
  });

  port = process.env.PORT || 3000;

  app.listen(port, function() {
    return console.log("listening on " + port);
  });

}).call(this);
