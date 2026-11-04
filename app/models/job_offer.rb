class JobOffer < ApplicationRecord
  extend FriendlyId
  include Imageable

  friendly_id :post, use: :slugged
  include Sluggable

  translates :post, :location, :job_type, fallbacks_for_empty_translations: false
  accepts_nested_attributes_for :translations, allow_destroy: true

  scope :active, -> { where(active: true).order(position: :asc) }

  def path
    "/karieri/forma-za-kandidatstvane?position=#{slug}"
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || post_changed?
  end
end
