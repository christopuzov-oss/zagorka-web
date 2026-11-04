class Contact < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, maximum: 40
  validates :email, presence: true
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :message, presence: true

  def title
    'Контакти'
  end
end
