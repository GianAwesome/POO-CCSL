Then /the event "(.+)" exists/ do |eventname|
  Event.exists?(name: eventname)
end