express = require 'express'
gcal = require './gcal'

app = express.createServer()
app.configure( ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'hbs')
)

app.get('/voice', (req, res) ->
  gcal ( (events) ->
    ctx = {}
    ctx.events = events
    res.contentType('xml')
    res.render('gcal', ctx)
  )
)

app.post('/sms', (req,res) ->
  res.contentType('xml')
  res.render('sms', {})
)


port = process.env.PORT || 3000
app.listen(port);
console.log("Express server listening on port %s", port)

