class SnippetHighlighter
  @queue = :snippets_queue

  API_LANGUAGES = {
    ruby: 'Ruby',
    javascript: 'JavaScript'
  }.freeze

  def self.perform(snippet_id)
    snippet = Snippet.find(snippet_id)

    data = {
      language: API_LANGUAGES[snippet.language.to_sym],
      source: snippet.plain_code,
      theme: 'Dawn'
    }
    uri = URI.parse('http://markup.su/api/highlighter')
    request = Net::HTTP.post_form(uri, data)
    snippet.update_attribute(:highlighted_code, request.body)
  end
end
