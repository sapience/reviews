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
RSpec.describe Review, type: :model do
  describe 'validation' do
    context 'when no reviewer_name' do
      let(:review) { build :review, reviewer_name: nil }

      it 'is not valid' do
        expect(review.valid?).to eq false
      end
    end

    context 'when no rating' do
      let(:review) { build :review, rating: nil }

      it 'is not valid' do
        expect(review.valid?).to eq false
      end
    end

    context 'when rating is string' do
      let(:review) { build :review, rating: 'string' }

      it 'is not valid' do
        expect(review.valid?).to eq false
      end
    end

    context 'when rating more than 5' do
      let(:review) { build :review, rating: 6 }

      it 'is not valid' do
        expect(review.valid?).to eq false
      end
    end

    context 'when rating less than 1' do
      let(:review) { build :review, rating: 0 }

      it 'is not valid' do
        expect(review.valid?).to eq false
      end
    end

    context 'when all correct' do
      subject { create :review, reviewer_name: 'Name', written_review: 'Some review', rating: 1 }

      it 'creates record' do
        expect(subject).to be_truthy
      end
    end
  end

  describe '#recalculate_product_overall_rating' do
    subject { review.save }

    let!(:review) { build :review }

    it 'call recalculate_overall_rating on a product' do
      expect(review.product).to receive(:recalculate_overall_rating)
      subject
    end
  end
end
