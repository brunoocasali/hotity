class Attraction < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: { message: 'não pode ser branco' }
  validates :midia, presence: { message: 'não pode ser branco' }
  validates :user_id, presence: { message: 'precisa estar relacionado a um usuário' }
end
