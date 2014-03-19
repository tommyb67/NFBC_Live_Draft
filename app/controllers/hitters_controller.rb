class HittersController < ApplicationController

  def import
    Hitter.import(params[:file])
    redirect_to root_url, notice: "Hitters imported."
  end

end