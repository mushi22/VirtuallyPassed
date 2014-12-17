json.array!(@subtopics) do |subtopic|
  json.extract! subtopic, :id, :name, :description, :video_link, :proof, :example
  json.url subtopic_url(subtopic, format: :json)
end
