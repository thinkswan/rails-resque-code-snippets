json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :title, :language, :content
  json.url snippet_url(snippet, format: :json)
end
