# frozen_string_literal: true

RSpec.describe ReviewsController, type: :request do
  include ERB::Util

  let(:product) { create :product, name: 'Best product' }

  describe '#new' do
    it 'gets a review form' do
      get "/products/#{product.id}/reviews/new", xhr: true

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Best product')
    end
  end

  describe '#create' do
    context 'without reviewer_name' do
      let(:params) do
        {
          review: {
            written_review: 'Text',
            rating: 1
          }
        }
      end

      it 'returns an error' do
        post "/products/#{product.id}/reviews", xhr: true, params: params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include(html_escape("Reviewer name can't be blank"))
      end
    end

    context 'when valid input data' do
      let(:params) do
        {
          review: {
            reviewer_name: 'Alex',
            written_review: 'Text',
            rating: 1
          }
        }
      end

      it 'creates a review' do
        post "/products/#{product.id}/reviews", xhr: true, params: params

        expect(response).to have_http_status(:ok)
        expect(Review.last.reviewer_name).to eq 'Alex'
      end
    end
  end
end
