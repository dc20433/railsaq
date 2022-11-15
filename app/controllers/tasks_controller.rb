class TasksController < ApplicationController
  before_action :authenticate
  before_action :load_task, except: [:new, :index, :create]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    @task.user = current_user
    if @task.save 
      redirect_to tasks_path, notice: "Task created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to @task, notice: "Task was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, alert: "Task was deleted."
  end

  private

  def load_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :priority)
  end
end
