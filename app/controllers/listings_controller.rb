class ListingsController < ApplicationController
  before_action :require_login, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    page = params[:page] || 1
    query = params[:query] || ""
    price_min = params[:price_min] || ""
    price_max = params[:price_max] || ""
    limit_city = params[:limit_city] || ""
    limit_country = params[:limit_country] || ""

    # @index = Listing.text_search(query).page(page).per(10)
    @index = Listing.scope_search(query,price_min,price_max,limit_city,limit_country)
    @index = @index.page(page).per(10)
  end

  def show
  end

  def new
    if signed_out? || current_user.tenant?
      redirect_to root_url, notice: 'You do not have the right to create a listing.'
    end
    @listing = Listing.new()
  end

  def create
    if signed_out? || current_user.tenant?
      redirect_to root_url, notice: 'You do not have the right to create a listing.'
    end

    @listing = current_user.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render 'new' }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    if @listing.nil? || ( @listing.user != current_user && !current_user.admin? )
      redirect_to root_url, notice: 'You do not have the right to edit this listing.'
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.nil? || ( @listing.user != current_user && !current_user.admin? )
      redirect_to root_url, notice: 'You do not have the right to edit this listing.'
    end

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render 'edit' }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.nil? || ( @listing.user != current_user && !current_user.admin? )
      redirect_to root_url, notice: 'You do not have the right to delete this listing.'
    end

    @listing.destroy
  end

  private
  def listing_params
    params.require(:listing).permit :title, :bedroom, :check_in, :check_out, :number_of_guest, :description, :rules, :price_per_night, :availability_requirement, {previews: []}
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
