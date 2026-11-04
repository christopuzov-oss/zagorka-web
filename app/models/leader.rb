class Leader < ApplicationRecord

  extend FriendlyId
  include Imageable

  friendly_id :name, use: :slugged
  include Sluggable

  translates :name, :post, :content, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  belongs_to :index_picture, class_name: 'Ckeditor::Picture', optional: true

  enum status: {draft: 0, published: 1}

  def path
    "/kompaniyata/leaders/#{slug}"
  end

  def title
    name
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || translation.name_changed?
  end
end
