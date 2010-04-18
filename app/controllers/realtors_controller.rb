class RealtorsController < ApplicationController
  def index
		@realtors = Realtor.all
  end

  def show
  	@realtor = Realtor.find(params[:id])
  end

end
