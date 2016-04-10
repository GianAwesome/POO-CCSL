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

events = [
  {:title => 'Evento 1', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-03-01', :time=>'03:25:00', :event_type_id =>1 },
    {:title => 'Evento 2', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-02-01', :time=>'03:24:00', :event_type_id =>1 },
    {:title => 'Evento 3', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-01-01', :time=>'00:25:00', :event_type_id =>1 },
    {:title => 'Evento 4', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-03-24', :time=>'03:25:00', :event_type_id =>1 },
    {:title => 'Evento 5', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-02-01', :time=>'03:25:00' , :event_type_id =>1},
    {:title => 'Evento 6', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :date=>'2016-01-01', :time=>'03:25:00', :event_type_id =>1 }

]

events.each do |event|
  Event.create!(event)
end