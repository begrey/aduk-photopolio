class NolController < ApplicationController
  def main
    
    @your = params[:talk]
    @album = (1..30).to_a.sample(1)
    @replay = ['응', '아니야'].sample(1)
  end
end
