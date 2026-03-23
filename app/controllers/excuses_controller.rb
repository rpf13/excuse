class ExcusesController < ApplicationController
  def index
    @excuse = session[:current_excuse]
    @excuse_count = ExcuseGenerator.count
    @topic_count = ExcuseGenerator.topic_count
  end

  def create
    session[:current_excuse] = ExcuseGenerator.generate

    redirect_to root_path, status: :see_other
  end
end
