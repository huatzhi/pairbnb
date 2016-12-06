require 'rails_helper'

RSpec.describe ListingsController, type: :controller do

  describe 'GET index' do
    before do
      30.times do
        x = Listing.new
        x.save
      end
      4.times do
        x = Listing.new
        x.country = 'Malaysia'
        x.save
      end
    end

    subject { get :index }

    it 'only assign 10 result into index' do
      get :index
      expect(assigns[:index].count).to eq 10
    end

    it 'only get search result if there is query' do
      get :index, {limit_country: "Malaysia"}
      expect(assigns[:index].count).to eq 4
    end

    it 'render index page' do
      expect(subject).to render_template(:index)
    end
  end

  describe 'GET show' do

  end
end
