class ListingsController < ApplicationController
  before_action :require_login, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    page = params[:page]
    page ||= 1
    @index = Listing.page(page)
  end

  def show
  end

  def new
    @listing = Listing.new()
  end

  def create
    @listing = current_user.listings.build(listing_params)
 
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
  end

  private
  def listing_params
    params.require(:listing).permit :title, :bedroom, :check_in, :check_out, :number_of_guest, :description, :rules, :price_per_night, :availability_requirement, :main_image
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
