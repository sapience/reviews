# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  rating         :integer          not null
#  reviewer_name  :string           not null
#  written_review :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :integer
#
# Indexes
#
#  index_reviews_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class Review < ApplicationRecord
  belongs_to :product

  validates :rating, :reviewer_name, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  after_commit :recalculate_product_overall_rating

  private

  def recalculate_product_overall_rating
    product.recalculate_overall_rating
  end
end
