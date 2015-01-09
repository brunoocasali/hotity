class Attraction < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: { message: 'não pode ser branco' }
  validates :midia, presence: { message: 'não pode ser branco' }
  validates :user_id, presence: { message: 'precisa estar relacionado a um usuário' }

  scope :attractions_new, Proc.new { |after = DateTime.now| where('display_date > ?', after).order("display_date ASC") }
  scope :attractions_old, Proc.new { |after = DateTime.now| where('display_date < ?', after).order("display_date ASC") }
end
