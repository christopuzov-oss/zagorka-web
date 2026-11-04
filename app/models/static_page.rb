class StaticPage < ApplicationRecord

  extend FriendlyId
  include Imageable

  include Sluggable
  friendly_id :title, use: :slugged

  translates :title, :summary, :content, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  include SearchCop

  search_scope :search do
    attributes title: "translations.title", content: "translations.content"
  end

  belongs_to :category
  belongs_to :index_picture, class_name: 'Ckeditor::Picture', optional: true
  belongs_to :mobile_picture, class_name: 'Ckeditor::Picture', optional: true

  def path
    "/#{category.slug}/#{slug}"
  end
  
  def search_summary
    summary&.truncate(80, separator: ' ')
  end

  def mobile_picture_url(style = 'xl')
    mobile_picture.try(:data).try { url style } or picture_url
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
