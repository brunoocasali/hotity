class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { message: 'deve ser unico' }
  validates :name, presence: { message: 'não pode ser branco' }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Formato invalido' }

  has_many attraction
end
