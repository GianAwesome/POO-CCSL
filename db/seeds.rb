# encoding: utf-8

event_types = [
  "palestra",
  "seminário",
  "curso",
  "mini-curso",
  "encontro",
  "reunião",
  "evento",
  "hackatona"
]

ActiveRecord::Base.transaction do
  event_types.each do |event_name|
    EventType.create("name" => event_name)
  end
end