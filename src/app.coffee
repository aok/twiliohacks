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

app.listen(3000);
console.log 'Express server listening on port 3000'

