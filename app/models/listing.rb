class Listing < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :previews, PreviewUploader
  has_many :reservations
  include PgSearch
  pg_search_scope :search, against: [:country, :city, :title, :description, :rules, :note],
    using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      self
    end
  end


end
