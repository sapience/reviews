# frozen_string_literal: true

module ProductsHelper
  def rating_array(product)
    rating = product.overall_rating || 0
    (1..5).map do |star|
      value = rating - star
      if value >= 0
        'bi-star-fill'
      else
        value <= -1 ? 'bi-star' : 'bi-star-half'
      end
    end
  end
end
