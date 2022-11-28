class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Group"
      @groups = Group.looks(params[:search], params[:word])
    else
      @tags = Tag.looks(params[:search], params[:word])
    end

    render 'index'
  end

end
