class SnippetHighlighter
  @queue = :snippets_queue

  def self.perform(snippet_id)
    snippet = Snippet.find(snippet_id)

    uri = URI.parse('http://markup.su/api/highlighter')
    request = Net::HTTP.post_form(uri, { language: snippet.language.humanize, source: snippet.plain_code, theme: 'Dawn' })
    snippet.update_attribute(:highlighted_code, request.body)
  end
end
