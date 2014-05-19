json.array!(@turns) do |turn|
  json.extract! turn, :id, :date_turn
  json.url turn_url(turn, format: :json)
end
