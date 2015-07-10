class Snippet < ActiveRecord::Base
  enum language: [ :ruby, :python, :javascript ]

  validates :language, presence: true
  validates :plain_code, presence: true
end
