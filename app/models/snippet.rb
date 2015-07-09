class Snippet < ActiveRecord::Base
  enum language: [ :ruby, :javascript ]

  validates :title, presence: true
  validates :language, presence: true
  validates :content, presence: true
end
