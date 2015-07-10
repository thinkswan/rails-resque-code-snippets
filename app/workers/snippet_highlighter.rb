class SnippetHighlighter
  @queue = :snippets_queue

  def self.perform(snippet_id)
    snippet = Snippet.find(snippet_id)

    uri = URI.parse(Snippet::API_URI)
    data = snippet.api_post_data
    request = Net::HTTP.post_form(uri, data)
    snippet.update_attribute(:highlighted_code, request.body)
  end
end
