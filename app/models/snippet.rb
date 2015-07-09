class Snippet < ActiveRecord::Base
  enum language: [ :ruby, :javascript ]

  validates :title, presence: true
  validates :language, presence: true
  validates :plain_code, presence: true
  validates :highlighted_code, absence: true
end
