json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :image_url, :time
  json.url post_url(post, format: :json)
end
