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
RSpec.describe Product, type: :model do
  describe 'validation' do
    context 'when no name' do
      let(:product) { build :product, name: nil }

      it 'is not valid' do
        expect(product.valid?).to eq false
      end
    end

    context 'when no description' do
      let(:product) { build :product, description: nil }

      it 'is not valid' do
        expect(product.valid?).to eq false
      end
    end

    context 'when name not unique' do
      subject { create :product, name: 'Name'}

      let!(:product) { create :product, name: 'Name' }

      it 'rises ActiveRecord::RecordInvalid' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'when all correct' do
      subject { create :product, name: 'Name', description: 'Desc', overall_rating: 1.4 }

      it 'creates record' do
        expect(subject).to be_truthy
      end
    end
  end

  describe '#recalculate_overall_rating' do
    let(:product) { create :product }
    let!(:review1) { create :review, product: product, rating: 1 }
    let!(:review2) { create :review, product: product, rating: 2 }
    let!(:review3) { create :review, product: product, rating: 3 }
    let!(:review4) { create :review, product: product, rating: 4 }

    it 'recalculates the rating' do
      expect(product.overall_rating).to eq 2.5
    end

  end
end
