class ListController < ApplicationController
  before_action :set_list, only: %i(edit update destroy)
  # before_action :set_board, only: %i(create)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to board_path(id: @list.board_id)
    else
      @list.valid?
      render action: :new
    end
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to board_path(id: @list.board_id)
    else
      @list.valid?
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_path(id: @list.board_id)
  end

  private
  def list_params
    params.require(:list).permit(:title, :board_id).merge(user: current_user)
  end

  def set_list
    @list = List.find_by(id: params[:id])
  end

end
