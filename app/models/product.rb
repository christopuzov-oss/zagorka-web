class Product < ApplicationRecord

  extend FriendlyId
  include Imageable

  include Sluggable
  friendly_id :name, use: :slugged

  translates :name, :summary, :content, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  include SearchCop

  search_scope :search do
    attributes name: "translations.name", content: "translations.content"
  end

  #belongs_to :index_picture, class_name: 'Ckeditor::Picture', optional: true
  belongs_to :logo,    class_name: 'Ckeditor::Picture', optional: true
  belongs_to :cover_picture,    class_name: 'Ckeditor::Picture', optional: true

  def path
    "/products/#{slug}"
  end

  def title
    name
  end

  def search_summary
    content&.truncate(80, separator: ' ')
  end

  def logo_url(style = 'xl')
    logo.try(:data).try { url style }
  end

  def cover_picture_url(style = 'xl')
    cover_picture.try(:data).try { url style }
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
