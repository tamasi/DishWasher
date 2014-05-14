json.array!(@turn_to_washes) do |turn_to_wash|
  json.extract! turn_to_wash, :id, :dateturn, :datename
  json.url turn_to_wash_url(turn_to_wash, format: :json)
end
