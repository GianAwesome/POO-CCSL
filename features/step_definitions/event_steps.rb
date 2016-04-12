Then /the event "(.+)" exists/ do |eventname|
  Event.exists?(name: eventname)
end

Then /the event "(.+)" does not exists/ do |eventname|
  !Event.exists?(name: eventname)
end

Given(/^the following event_type exists:$/) do |event_type_table|
	event_type_table.hashes.each do |event_type|
		EventType.create(event_type)
	end
end

Given(/^the following events exists:$/) do |events_table|
	events_table.hashes.each do |event|
		bla = Event.create(event.merge user: User.find(1))
    print bla.time
	end
end
