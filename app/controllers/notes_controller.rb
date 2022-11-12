class NotesController < ApplicationController
  before_action :load_task

  def index
   
  end

  private

  def load_task
    @task = Task.find params[:task_id]
  end

end
