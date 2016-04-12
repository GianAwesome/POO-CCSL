Then /the event_type "(.+)" exists/ do |eventtypename|
  EventType.exists?(name: eventtypename)
end

Given(/^the following event_type exists:$/) do |event_type_table|
  event_type_table.hashes.each do |event_type|
    EventType.create(event_type)
  end
end