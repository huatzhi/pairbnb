class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  def calculate_price
    #calculate price
    duration = (self.check_out - self.check_in).to_i
    self.total_price = self.listing.price_per_night * duration
    self.save
  end
end
