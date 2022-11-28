class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:tag)
  end

end
