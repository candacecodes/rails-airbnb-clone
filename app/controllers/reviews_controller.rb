class ReviewsController < ApplicationController

    def new
        @review = Review.new(params[:id])
    end
    
    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to guest_path(@review.guest_id)
        else
            flash[:message] = @review.errors.full_messages
            render :new
        end
    end


    private

    def review_params
        params.require(:review).permit(:rating, :comment, :reservation_id, :guest_id)
    end

    def set_review
        @review = Review.find(params[:id])
    end
end
