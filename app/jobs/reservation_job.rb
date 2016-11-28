class ReservationJob < ActiveJob::Base
  queue_as :default


  def perform(tenant, host, reservation_id)
    ReservationMailer.booking_email(tenant, host, reservation_id).deliver
  end
end
