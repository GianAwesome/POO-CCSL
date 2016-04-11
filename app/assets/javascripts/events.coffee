$(document).ready ->
  $('#calendar').fullCalendar({
    editable: false,
    defaultView: 'agendaWeek',
    events: "/calendar_events"
  });