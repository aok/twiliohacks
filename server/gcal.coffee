_ = require 'underscore'
ical = require 'ical'
moment = require 'moment'

finnishPublicHolidays = 'http://www.google.com/calendar/ical/en.finnish%23holiday%40group.v.calendar.google.com/public/basic.ics'

collect = (callback) ->
  (err, data) ->
    now = moment()
    evts = _(data).chain()
      .filter((evt) -> evt.start > now)
      .sortBy((evt) -> evt.start)
      .map((evt) ->
        evt.fromNow = moment(evt.start).fromNow()
        return evt
      )
      .value()
    callback evts

futureEvents = (emitter) ->
  ical.fromURL(finnishPublicHolidays,{}, collect (evts) ->
    emitter evts
  )

module.exports = futureEvents

futureEvents console.log if !module.parent