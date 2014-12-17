json.array!(@proofs) do |proof|
  json.extract! proof, :id, :name, :video_link, :content
  json.url proof_url(proof, format: :json)
end
