class Api::TodosController < ApplicationController
    def show
        @todo = Todo.find(params[:id])
        render json: @todo
    end

    def index
        @todos = Todo.all
        render json: @todos
    end
    
    def create
        @todo = todo.new(todo_params)
        if @todo.save
          render json: @todo
        else
          render json: @todo.errors.full_messages, status: 422
        end
    end

    def update
        @todo = todo.find(params[:id])
        if @todo.update(todo_params)
          render json: @todo
        else
          render json: @todo.errors.full_messages, status: 422
        end
    end

    def destroy
        @todo = todo.find(params[:id])
        if @todo.destroy
            render json: Todo.all
        else
            render json: @todo.errors.full_messages, status: 422
        end
    end

    private

    def todo_params
        params.require(:todo).permit(:body, :done)
    end
    
end
