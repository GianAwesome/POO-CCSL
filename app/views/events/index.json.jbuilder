json.array!(@events) do |event|
  json.extract! event, :id, :title, :summary, :time, :date, :place, :address, :speaker, :responsible, :performance, :url, :event_type_id
  json.url event_url(event, format: :json)
end
