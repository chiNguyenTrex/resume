class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  validates :main_image, presence: true
  validates :thumb_image, presence: true
end
