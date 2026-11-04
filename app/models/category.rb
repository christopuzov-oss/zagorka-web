class Category < ApplicationRecord

  extend FriendlyId

  friendly_id :name, use: :slugged
  include Sluggable

  translates :name, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  has_many :static_pages

  scope :main_menu, -> { where(show_in_header: true).order(position: :asc) }

  def path
    "/#{slug}/#{static_pages&.first&.slug}"
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
