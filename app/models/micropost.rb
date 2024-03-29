class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  delegate :name, to: :user, prefix: true

  validates :user_id, presence: true
  validates :content, presence: true,
                      length: {maximum: Settings.maximum_content_length}
  validates :image, content_type: {in: Settings.image_type,
                                   message: :invalid_format},
                    size: {less_than: Settings.max_image_size.megabytes,
                           message: :large_size}

  scope :recent_posts, ->{order(created_at: :desc)}

  def display_image
    image.variant resize_to_limit: [Settings.image_limit, Settings.image_limit]
  end
end
