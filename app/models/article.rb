class Article < ApplicationRecord

  belongs_to :user
  has_many :reviews
  belongs_to :category

  extend FriendlyId
   friendly_id :title, use: :slugged




  validates_presence_of :title, :body, :category_id, :publish_date
  validates_uniqueness_of :title, :body
  validates_length_of :body, minimum: 25
  validate :publish_date_is_not_greater_than_todays_date

  def publish_date_is_not_greater_than_todays_date
    if (publish_date > Date.today + 30.days)
      self.errors.add(:publish_date, "Date Must be not greater than one  month from todays date  ")
    elsif(publish_date <= Date.today)
       is_published = true
     end
end


mount_uploader :cover, CoverUploader
end
