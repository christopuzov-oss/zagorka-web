module Imageable
  extend ActiveSupport::Concern

  included do
    belongs_to :picture, class_name: 'Ckeditor::Picture', optional: true
    #has_one :picture, as: :imageable, inverse_of: :imageable, dependent: :destroy, class_name: 'Ckeditor::Picture'
    #accepts_nested_attributes_for :picture, allow_destroy: true
  end

  def data
    picture.data
  end

  def picture_url(style = 'original')
    picture.try(:data).try { url style }
  end

end
