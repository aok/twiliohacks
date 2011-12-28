express = require 'express'

app = express.createServer()
app.configure( ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'hbs')
)

app.get('/', (req, res) ->
  res.contentType('application/xml')
  res.send '<?xml version="1.0" encoding="UTF-8"?>\n<Response><Say>Hello World</Say></Response>\n'
)

app.get('/hello-hbs.html', (req, res) ->
  res.render('hello',{title: 'Hello Handlebars', paragraph: 'Bars!'})
)

app.listen(3000);
console.log 'Express server listening on port 3000'

