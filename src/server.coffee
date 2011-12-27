express = require 'express'

app = express.createServer()

app.get('/', (req, res) ->
  res.contentType('application/xml')
  res.send '<?xml version="1.0" encoding="UTF-8"?>\n<Response><Say>Hello World</Say></Response>\n'
)

app.listen(3000);