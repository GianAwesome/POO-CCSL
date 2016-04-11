setup = ->
  $('#calendar').fullCalendar
    editable: false
    defaultView: 'agendaWeek'
    lang: 'pt'
    allDaySlot: false
    events: 'calendar_events.json'
  return

$(document).on 'ready', setup
$(document).on 'page:load', setup