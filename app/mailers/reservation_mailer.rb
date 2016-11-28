class ReservationMailer < ApplicationMailer
  def booking_email(tenant, host, reservation_id)
    #do something
    @tenant = tenant
    @url = root_url #reservation_url(reservation_id)
    mail to: @tenant.email, subject: 'Nice it work'
  end
end
