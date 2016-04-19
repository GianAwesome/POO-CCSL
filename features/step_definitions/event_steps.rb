Then /the event "(.+)" exists/ do |eventname|
  Event.exists?(title: eventname)
end

Then /the event "(.+)" does not exists/ do |eventname|
  !Event.exists?(title: eventname)
end

Given(/^the following events exists:$/) do |events_table|
	events_table.hashes.each do |event|
    if event["time"] == "1"
      event["time"] = Time.now + (Random.rand(10) + 1).days
    elsif event["time"] == "0"      
      event["time"] = Time.now - (Random.rand(10) + 1).days
    end
		Event.create(event)
	end
end
