class Listing < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :previews, PreviewUploader
  has_many :reservations
  include PgSearch
  pg_search_scope :search, against: [:country, :city, :title, :description, :rules, :note],
    using: {tsearch: {dictionary: "english"}}
  scope :price_min, -> (price_min) {where("price_per_night >= ?", price_min)}
  scope :price_max, -> (price_max) {where("price_per_night <= ?", price_max)}
  scope :limit_city, -> (city) {where("city like ?", "%#{city}%")}
  scope :limit_country, -> (country) {where("country like ?", "%#{country}%")}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      self
    end
  end


end
