Then /the event "(.+)" exists/ do |eventname|
  Event.exists?(title: eventname)
end

Then /the event "(.+)" does not exists/ do |eventname|
  !Event.exists?(title: eventname)
end

Given(/^the following events exists:$/) do |events_table|
	events_table.hashes.each do |event|
		Event.create(event.merge user: User.find_by(username: event[:user]))
	end
end
