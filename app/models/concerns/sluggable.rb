module Sluggable
  extend ActiveSupport::Concern

  def should_generate_new_friendly_id?
    slug.blank?
  end
end
