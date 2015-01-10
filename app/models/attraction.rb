class Attraction < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: { message: 'Um nome é necessário' }
  validates :midia, presence: { message: 'Uma mídia é necessário' }
  validates :user_id, presence: { message: 'Precisa estar relacionado a um usuário' }

  scope :attractions_new, Proc.new { |after = DateTime.now| where('display_date > ?', after).order("display_date ASC") }
  scope :attractions_old, Proc.new { |after = DateTime.now| where('display_date < ?', after).order("display_date ASC") }
end
