class HittersController < ApplicationController


  def index
    @hitters = Hitter.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_date @hitters.to_csv }
      format.xls { send_data @hitters.to_csv(col_sep: "\t") }
    end
  end


  def import
    Hitter.import(params[:file])
    redirect_to root_url, notice: "Hitters imported."
  end

  private

    def hitter_params
      params.require(:hitter).permit(:player_id, :name, :pos1, :pos2, :pos3, :ab, :run, :hit, :hr, :rbi, :sb, :zola_mix12, :zola_rank)
    end

end