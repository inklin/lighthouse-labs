class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :song

  validates :user_id, presence: true
  validates :song_id, presence: true
  validates :content, length: { minimum: 20 }

  validate :user_cannot_review_song_twice, on: :create

  private

  def user_cannot_review_song_twice
    song_review = user.reviews.find_by(song_id: song.id)
    if song_review
      errors.add(:base, "cannot review the same song twice")
    end
  end

end