# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_product, only: %i[new create]

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.js { redirect_to products_url, notice: 'Review was successfully created.' }
      else
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:reviewer_name, :written_review, :rating)
  end
end
