express = require 'express'

app = express.createServer()
app.configure( ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'hbs')
)

app.get('/', (req, res) ->
  res.contentType('xml')
  res.render('hello', {name: 'World'})
)

port = process.env.PORT || 3000
app.listen(port);
console.log("Express server listening on port %s", port)

