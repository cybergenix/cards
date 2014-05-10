json.array!(@notes) do |note|
  json.extract! note, :id, :title, :fields
  json.url note_url(note, format: :json)
end
