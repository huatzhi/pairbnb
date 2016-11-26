class ReservationsController < ApplicationController
  def create
    # insert authorize here
    unless current_user.tenant?
      redirect_to url_root
    end
    listing = Listing.find(params[:listing_id])
    if listing.nil?
      redirect_to root_url
    end
    reservation = listing.reservation.new(reservation_params)
    reservation.user = current_user
    reservation.calculate_price
    if reservation.save
      redirect_to listing, notice 'reservation succeed'
    else
      redirect_to listing, notice 'reservation failure'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit :check_in, :check_out
  end
end

#jquery ui date picker
