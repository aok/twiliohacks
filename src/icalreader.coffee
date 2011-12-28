_ = require 'underscore'
ical = require 'ical'
moment = require 'moment'

gcalUrl = 'http://www.google.com/calendar/ical/aok%40reaktor.fi/private-c13abbdb0c9fd78c9bdcc6bde23b7e36/basic.ics'

collectAndLog = (err, data) ->
  now = moment()
  evts = _(data).chain()
    .filter((evt) -> evt.start > now)
    .sortBy((evt) -> evt.start)
    .map((evt) ->
      evt.fromNow = moment(evt.start).fromNow()
      return evt
    )
    .value()
  console.log evts

ical.fromURL(gcalUrl,{},collectAndLog)
console.log 'waiting for callbacks'
