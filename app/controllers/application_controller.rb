class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :init, :set_locale, :load_menu_items, :load_footer_articles

  helper_method :mobile?

  def init
    @page = {}
    @page[:site_name] = Rails.application.config.base_url
    @page[:url] = request.base_url + request.path if @page[:url].blank?
    @page[:image] = request.base_url + ActionController::Base.helpers.asset_path("meta_image.jpg")

    @page[:title]       = 'Загорка България'
    @page[:description] = 'Загорка България - zagorkacompany.bg'
    @page[:keywords]    = 'Загорка, Ариана, Амстел,Heineken, Zagorka, Ariana, Amstel, Desperados, Stotichno, SOL, Крадецът на ябълки, Starobrno, бира, бири'
  end

  def set_locale
    I18n.backend.reload! if Rails.env == 'development'
    if params[:locale] =~ /^(bg|en)$/
      I18n.locale = params[:locale]
      cookies.permanent[:locale] = params[:locale]
    else
      if cookies.key?(:locale) && cookies[:locale] =~ /^(bg|en)$/
        I18n.locale = cookies[:locale]
      else
        I18n.default_locale
      end
      I18n.locale = cookies[:locale] || I18n.default_locale
    end
  end

  def mobile?
    browser = Browser.new(request.user_agent, accept_language: "en-us")
    return browser.device.mobile?
  end


  protected

  def load_menu_items
    main_categories = Category.main_menu.to_a
      #Rails.cache.fetch 'main_categories', expires_in: 30.minutes do
      #  Category.main_menu.to_a
      #end

    @left_menu = [main_categories.shift]
    @right_menu = main_categories
  end

  def load_footer_articles
    @footer_articles = Rails.cache.fetch 'footer_articles', expires_in: 30.minutes do
      Category.where(show_in_footer: true).map{|c| c.static_pages}.flatten
    end
  end



end
