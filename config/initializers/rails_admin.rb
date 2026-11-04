RailsAdmin.config do |config|

  config.authenticate_with do
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.config.username && password == Rails.application.config.password
    end
  end

  config.included_models = %w(  Article 
                                Article::Translation
                                Category
                                Category::Translation
                                Career
                                JobOffer
                                JobOffer::Translation
                                Leader
                                Leader::Translation 
                                Product
                                Product::Translation
                                Slider
                                Slide
                                Slide::Translation
                                StaticPage
                                StaticPage::Translation
                                Ckeditor::Picture
                                Ckeditor::AttachmentFile )

  config.model Article do
    list do
      field :picture do
        pretty_value do
          bindings[:view].tag(:img, { src: bindings[:object].picture_url(:s) })
        end
      end
      field :status
      field :title
    end
    field :translations, :globalize_tabs
    configure :content, :ck_editor
    fields :picture, :cover_picture, :status, :meta_description, :meta_keywords, :featured, :publish_at
  end

  config.model 'Article::Translation' do
    visible false
    configure :content, :ck_editor
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :summary, :content
  end

  config.model Category do
    nestable_list true
    field :translations, :globalize_tabs
    fields :position, :show_in_header, :show_in_footer
  end

  config.model 'Category::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :name
  end

  config.model JobOffer do
    list do
      field :post
      field :location
      field :job_type
    end
    field :translations, :globalize_tabs
    fields :position, :active, :picture
  end

  config.model 'JobOffer::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :post,  :location, :job_type
  end    

  config.model Product do
    list do
      field :picture do
        pretty_value do
          bindings[:view].tag(:img, { src: bindings[:object].logo_url })
        end
      end
      field :name
    end
    nestable_list true
    field :translations, :globalize_tabs
    configure :content, :ck_editor
    fields :picture, :logo, :cover_picture,:position, :meta_description, :meta_keywords, :facebook_link, :youtube_link, :instagram_link, :official_site_link, :store_link
    
  end
  config.model 'Product::Translation' do
    visible false
    configure :content, :ck_editor
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :name, :summary, :content
  end 

  config.model StaticPage do
    list do
      field :picture do
        pretty_value do
          bindings[:view].tag(:img, { src: bindings[:object].picture_url(:s) })
        end
      end
      field :title
    end
    field :translations, :globalize_tabs
    configure :content, :ck_editor
    fields :picture, :mobile_picture, :banner_url, :position, :meta_description,:meta_keywords, :category
  end

  config.model 'StaticPage::Translation' do
    visible false
    configure :content, :ck_editor
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :summary, :content
  end 

  config.model Slide do
    list do
      field :picture do
        pretty_value do
          bindings[:view].tag(:img, { src: bindings[:object].picture_url(:s) })
        end
      end
      field :headline
      field :summary
    end
    field :translations, :globalize_tabs
    configure :bullet, :enum do
      enum_method do
        :bullets
      end
      queryable false
    end
    fields :url, :bullet, :right_align, :picture, :sliders
  end

  config.model 'Slide::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :headline, :summary, :label
  end    


  config.model Leader do
    list do
      field :picture do
        pretty_value do
          bindings[:view].tag(:img, { src: bindings[:object].picture_url(:s) })
        end
      end
      field :name
      field :status
    end
    field :translations, :globalize_tabs
    configure :content, :ck_editor
    fields :picture, :slug, :meta_description, :meta_keywords, :position, :status
  end

  config.model 'Leader::Translation' do
    visible false
    configure :content, :ck_editor
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :name, :post, :content
  end    


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete do
      except %(Category)
    end
    show_in_app
    nestable

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

