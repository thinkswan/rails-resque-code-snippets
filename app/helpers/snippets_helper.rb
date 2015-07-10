module SnippetsHelper
  def formatted_language snippet
    Snippet::API_LANGUAGES[snippet.language.to_sym]
  end
end
