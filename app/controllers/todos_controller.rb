class TodosController < ApplicationController
  def index
    respond_to do |format|
      @todos = Todo.order('created_at DESC')
      format.html
      format.json
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html do
          flash[:success] = 'Todo created!'
          redirect_to root_path
        end
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @todo.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    todo = Todo.find_by_id(params[:id])
    respond_to do |format|
      if todo && todo.destroy
        format.html do
          flash[:success] = 'Todo marked as done!'
          redirect_to root_path
        end
        format.json { head :no_content }
      else
        format.html do
          flash[:warning] = 'There was an error.'
          redirect_to root_path
        end
        format.json { head 500 }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end