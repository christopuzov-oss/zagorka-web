class Article < ApplicationRecord

  extend FriendlyId
  include Imageable

  include Sluggable
  friendly_id :title, use: :slugged

  translates :title, :summary, :content, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true
  
  before_save :set_publish_at, if: -> { !publish_at.present? }
  
  include SearchCop

  search_scope :search do
    attributes title: "translations.title", content: "translations.content"
  end

  enum status: {draft: 0, published: 1}
  belongs_to :index_picture, class_name: 'Ckeditor::Picture', optional: true
  belongs_to :cover_picture, class_name: 'Ckeditor::Picture', optional: true

  def path
    "/articles/#{slug}"
  end

  def search_summary
    summary&.truncate(80, separator: ' ')
  end

  def cover_picture_url(style = 'xl')
    cover_picture.try(:data).try { url style } or picture_url
  end

  private

  def set_publish_at
    self.publish_at = Time.now
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
