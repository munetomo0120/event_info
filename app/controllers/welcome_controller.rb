class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result.page(params[:page]).per(10).where("start_at > ?", Time.zone.now).order(:start_at)
    # @events = Event.page(params[:page]).per(10).where("start_at > ?", Time.zone.now).order(:start_at)
  end
end
