class Hike < ActiveRecord::Base
  belongs_to :user
  belongs_to :rank

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Hike.all.find do |single_hike|
      single_hike.slug == slug
    end
  end

end
