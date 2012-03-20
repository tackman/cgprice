(function() {
  var app, express, port;

  express = require('express');

  app = express.createServer();

  app.get('/', function(req, res) {
    return res.send('Heroku, node.js and coffee scriptでHello World!');
  });

  port = process.env.PORT || 3000;

  app.listen(port, function() {
    return console.log("listening on " + port);
  });

}).call(this);
