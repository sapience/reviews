# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  description         :text             not null
#  name                :string           not null
#  overall_rating      :float
#  tumbnail_image_path :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_products_on_name  (name) UNIQUE
#
class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  def recalculate_overall_rating
    with_lock do
      new_rating = reviews.sum(:rating).to_f / reviews.count
      update(overall_rating: new_rating)
    end
  end
end
