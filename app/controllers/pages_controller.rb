# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @news = News.published.latest
                .limit(Settings.news.latest.size)
    @sliders = Slider.localized
    @partner_types = PartnerType.includes(:partners)
  end
end
