class Snippet < ActiveRecord::Base
  enum language: [ :ruby, :python, :javascript ]

  validates :language, presence: true
  validates :plain_code, presence: true

  # http://markup.su/highlighter/api
  API_URI = 'http://markup.su/api/highlighter'
  API_THEME = 'Cobalt'
  API_LANGUAGES = {
    ruby: 'Ruby',
    python: 'Python',
    javascript: 'JavaScript'
  }

  def api_post_data
    {
      language: API_LANGUAGES[language.to_sym],
      theme: API_THEME,
      source: plain_code
    }
  end
end
