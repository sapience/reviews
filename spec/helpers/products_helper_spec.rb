# frozen_string_literal: true

RSpec.describe ProductsHelper, type: :request do
  include ProductsHelper

  let(:product) { create :product, overall_rating: 2.4 }
  let(:expected_styles) { %w[bi-star-fill bi-star-fill bi-star-half bi-star bi-star] }

  it 'returns an array of styles' do
    expect(rating_array(product)).to match_array(expected_styles)
  end
end
