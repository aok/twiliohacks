express = require 'express'

app = express.createServer()

app.get('/', (req, res) ->
    res.send '<?xml version="1.0" encoding="UTF-8" ?><Response><Say>Hello World</Say></Response>'
)

app.listen(3000);
