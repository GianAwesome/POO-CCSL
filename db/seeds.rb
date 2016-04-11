# encoding: utf-8
admin = {:username =>'admin', :password=>'saasbook', :admin=>true}
user = {:username =>'user', :password=>'saasbook', :admin=>false}
user2 = {:username =>'user2', :password=>'saasbook', :admin=>false}

User.create!(admin)
User.create!(user)
User.create!(user2)

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
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-03-01 03:25:00', :event_type_id =>2 },
    {:title => 'Evento 2', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-02-01 03:24:00', :event_type_id =>2 },
    {:title => 'Evento 3', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-01-01 00:25:00', :event_type_id =>2 },
    {:title => 'Evento 4', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-03-24 03:25:00', :event_type_id =>2 },
    {:title => 'Evento 5', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-02-01 03:25:00' , :event_type_id =>2},
    {:title => 'Evento 6', :summary=>'um evento teste', :place => 'Auditorio do CCSL', 
    :address => 'perto do IME', :speaker => 'Junior Barreira' , :responsible => 'todos' , 
    :performance => 'huehuheuhe', :user_id=>1, :time=>'2016-01-01 03:25:00', :event_type_id =>2 }

]

events.each do |event|
  Event.create!(event)
end