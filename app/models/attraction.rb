class Attraction < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: { message: 'Um nome é necessário' }
  validates :midia, presence: { message: 'Uma mídia é necessário' }
  validates :user, presence: { message: 'Precisa estar relacionado a um usuário' }

  scope :attractions_new, -> { where(:display_date > after).order(:display_date) }
  scope :attractions_old, -> { where(:display_date < after).order(:display_date) }
end
