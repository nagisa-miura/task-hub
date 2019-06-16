class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
    @user = User.find_by(id: current_user.id)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to :root
    else
      @board.valid?
      render action: :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :detail, :user_id).merge(user: current_user)
  end
end
