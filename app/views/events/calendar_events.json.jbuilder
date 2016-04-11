json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.start event.time
  json.url event_path(event)
end