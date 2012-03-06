redis = require('redis-url').connect(process.env.REDISTOGO_URL)
express = require 'express'
gcal = require './gcal'

app = express.createServer()
app.configure( ->
  app.set('views', __dirname + '/views')
  app.set('view engine', 'hbs')
)

app.get('/voice', (req, res) ->
  console.log "Call from: "+req.query.From
  blurt = (error, url) ->
    renderEvents = (evts) ->
      ctx = {}
      ctx.events = evts
      res.render 'gcal',ctx
    if error
      res.render 'error',{}
    else
      gcal(renderEvents, url)

  res.contentType('xml')
  key = 'caller:'+req.query.From+':calendar.url'
  redis.get(key, blurt)
)

app.post('/sms', (req,res) ->
  res.contentType('xml')
  res.render('sms', {})
)


port = process.env.PORT || 3000
app.listen(port);
console.log("Express server listening on port %s", port)

