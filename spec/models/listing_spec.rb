require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe Listing do
    it "belongs to user" do
      usr = User.new
      lst = Listing.new
      usr.listings << lst
      expect(lst.user).to be usr
    end

    it "has many reservations" do
      rsv1 = Reservation.new
      rsv2 = Reservation.new
      lst = Listing.new
      lst.reservations << rsv1
      lst.reservations << rsv2
      expect(lst.reservations[0]).to be rsv1
      expect(lst.reservations[1]).to be rsv2
    end
  end
  # describe 'true' do
  #   it 'is true' do
  #     expect(true).to eq true
  #   end
  # end

  describe 'Listing#text_search' do
    before do
      lstar = []
      10.times do
        lstar << Listing.new
      end
      lstar[2].country = 'Malaysia'
      lstar[8].country = 'Malaysia'
      lstar.each do |list|
        list.save
      end
    end

    it 'return himself when no argument is given' do
      expect(Listing.text_search).to eq Listing
    end

    it 'return empty array when find no relevant result' do
      expect(Listing.text_search 'Singapore').to eq []
    end

    it 'return only the listings that are relevant in array when result is found' do
      expect(Listing.text_search('Malaysia').count).to eq 2
      expect(Listing.text_search('Malaysia')[0].country).to eq 'Malaysia'
      expect(Listing.text_search('Malaysia')[1].country).to eq 'Malaysia'
    end
  end
end
