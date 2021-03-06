class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end
  def create
    @product = Product.find(params[:product_id])
    @review = @product.review.new(allowed_params)
    @review.user = current_user
    @review.save!


    redirect_to product_path(@product)

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_path(params[:product_id])

  end

  private
    def allowed_params
      params.require(:review).permit(:rating, :description)
    end
end
