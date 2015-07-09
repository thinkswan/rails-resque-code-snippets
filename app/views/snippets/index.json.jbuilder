json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :title, :language, :plain_code
  json.url snippet_url(snippet, format: :json)
end
