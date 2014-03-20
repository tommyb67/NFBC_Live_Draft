class HittersController < ApplicationController


  def index
    @hitters = Hitter.order(:name)
  end


  def import
    Hitter.import(params[:file])
    redirect_to root_url, notice: "Hitters imported."
  end

  private

    def hitter_params
      params.require(:name, :pos1, :ab, :run, :hit, :hr, :rbi, :sb, :avg).permit(:player_id, :pos2, :pos3, :ab, :zola_mix12, :zola_rank)
    end

end