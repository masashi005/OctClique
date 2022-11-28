class TagListsController < ApplicationController
  def new
    @tag_list = TagList.new
  end

  def create
    @tag_list = TagList.new(tag_list_params)
    @tag_list.save
  end

  def destroy
    @tag_list = TagList.find(params[:id])
    @tag_list.destroy
  end

  private

  def tag_list_params
    params.require(:tag_list).permit(:tag_id,:group_id)
  end
end
