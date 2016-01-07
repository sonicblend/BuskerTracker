class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to @rating, notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
    redirect_to ratings_url, notice: 'Rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.require(:rating).permit(:emotion, :comment, :performance_id, :user_id)
    end
end
