class Slide < ApplicationRecord
  include Imageable
  
  has_and_belongs_to_many :sliders

  translates :headline, :summary, :label, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum bullets: { default: 0,
                  zagorka: 1,
                  staroburno: 2,
                  heineken: 3,
                  zagorka_retro: 4
                }
end
