class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :song, :counter_cache => true

  validates :user_id, presence: true
  validates :song_id, presence: true
  validates :content, length: { minimum: 10 }
  validates :rating, numericality: { only_integer: true, in: 1..5 }
  validate :user_cannot_review_song_twice, on: :create

  private

  def user_cannot_review_song_twice
    if Review.where("user_id = ? AND song_id = ?", user.id, song.id).take
      errors.add(:base, "cannot review the same song twice")
    end
  end

end