module ApplicationHelper

    def title
    object = instance_variable_get '@' + controller_name.singularize
    second_part =
      if object.is_a? ActiveRecord::Base
        object.title
      else
        @page[:title]
      end
  end

  def fulltitle
    "#{title} | #{Rails.application.config.site_name}"
  end

  def image
    object = instance_variable_get '@' + controller_name.singularize
    if object.is_a?(ActiveRecord::Base) && object.try(:picture_url)
      "#{Rails.application.config.base_url}#{object.picture_url :l}"
    else
      @page[:image]
    end
  end

  def meta_data
    object = instance_variable_get '@' + controller_name.singularize
    meta = {}

    if object.is_a? ActiveRecord::Base
      meta[:keywords] = object.try :meta_keywords
      meta[:description] = object.try :meta_description
    end

    if meta[:keywords].blank? || meta[:description].blank?
      meta.reverse_merge! keywords: @page[:keywords], description: @page[:description]
    end

    meta[:'og:site_name'] = Rails.application.config.site_name
    meta[:'og:title'] = title
    meta[:'og:url'] = request.original_url
    meta[:'og:locale'] = I18n.locale
    meta[:'og:image'] = image
    meta[:'og:image:type'] = 'image/png'
    meta[:'og:description'] = meta[:description]
    meta[:'og:type'] = 'article'
    #meta[:'fb:app_id'] = '465843588496698'
    #meta[:'fb:admins'] = '100078292158770,100008709513521'

    meta[:'twitter:card'] = 'summary'
    meta[:'twitter:url'] = request.original_url
    meta[:'twitter:title'] = title
    meta[:'twitter:description'] = meta[:description]
    meta[:'twitter:image'] = image

    meta
  end

  def meta_data_tags
    meta_data.map do |name, content|
      if name.to_s.include? 'og:'
        tag 'meta', property: name, content: content
      else
        tag 'meta', name: name, content: content
      end
    end.join("\n")
  end
  
end
