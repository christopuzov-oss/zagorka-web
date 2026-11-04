class JobOffersController < ApplicationController
  before_action :find_category

  def index
    @job_offers = JobOffer.active
  end

  def show
    @career = Career.new
  end

  def apply
    @career = Career.new(career_params)
    if verify_recaptcha(model: @career) && @career.save
      ApplicationMailer.career_mail(@career).deliver_later
      redirect_to '/karieri/forma-za-kandidatstvane', notice: t('.success')
    else
      #flash.now[:error] = t('.error')
      render :show
    end
  end

  def find_category
    @category = Category.friendly.find 'karieri'
    @articles = @category.static_pages
  end


  private

  def career_params
    params.require(:career).permit(:city, :first_name, :last_name, :email, :phone, :cv, :terms)
  end

end