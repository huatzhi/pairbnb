class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  before_save :calculate_price

  def paid!
    self.paid = true
    self.save!
  end

  def paid?
    self.paid
  end

  private
  def calculate_price
    #calculate price
    duration = (self.check_out - self.check_in).to_i
    self.total_price = self.listing.price_per_night * duration
    self.save
  end
end
