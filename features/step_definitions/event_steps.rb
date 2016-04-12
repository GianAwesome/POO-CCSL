Then /the event "(.+)" exists/ do |eventname|
  Event.exists?(title: eventname)
end

Given(/^the following events exists:$/) do |events_table|
	events_table.hashes.each do |event|
		Event.create(event)
	end
end
