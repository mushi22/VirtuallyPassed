json.array!(@examples) do |example|
  json.extract! example, :id, :name, :video_link, :content
  json.url example_url(example, format: :json)
end
