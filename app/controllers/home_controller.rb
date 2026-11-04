class HomeController < ApplicationController
  def index
    @sliders = Slider.order(position: :asc).includes(:slides)
  end

  def age_gate
    render layout: false
  end
end
