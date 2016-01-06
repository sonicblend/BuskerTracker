# == Schema Information
#
# Table name: buskers
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image_id    :string
#  facebook    :string
#  twitter     :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BuskersController < ApplicationController
  before_action :set_busker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  # GET /buskers
  def index
    @buskers = Busker.all
  end

  # GET /buskers/1
  def show
  end

  # GET /buskers/new
  def new
    @busker = Busker.new
  end

  # GET /buskers/1/edit
  def edit
  end

  # POST /buskers
  def create
    @busker = Busker.new(busker_params)

    if @busker.save
      redirect_to @busker, notice: 'Busker was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /buskers/1
  def update
    if @busker.update(busker_params)
      redirect_to @busker, notice: 'Busker was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /buskers/1
  def destroy
    @busker.destroy
    redirect_to buskers_url, notice: 'Busker was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busker
      @busker = Busker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def busker_params
      params.require(:busker).permit(:name, :description, :image_id, :facebook, :twitter, :website)
    end
end
