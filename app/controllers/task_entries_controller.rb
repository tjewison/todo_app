class TaskEntriesController < ApplicationController
  before_action :set_task_entry, only: [:show, :update, :destroy]
  respond_to :json

  # GET /task_entries
  # GET /task_entries.json
  def index
    @task_entries = TaskEntry.all
  end

  # GET /task_entries/1
  # GET /task_entries/1.json
  def show
  end

  # POST /task_entries
  # POST /task_entries.json
  def create
    @task_entry = TaskEntry.new(task_entry_params)

    respond_to do |format|
      if @task_entry.save
        format.json { render action: 'show', status: :created, location: @task_entry }
      else
        format.json { render json: @task_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_entries/1
  # PATCH/PUT /task_entries/1.json
  def update
    respond_to do |format|
      if @task_entry.update(task_entry_params)
        format.json { head :no_content }
      else
        format.json { render json: @task_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_entries/1
  # DELETE /task_entries/1.json
  def destroy
    @task_entry.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_entry
      @task_entry = TaskEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_entry_params
      params.require(:task_entry).permit(:description)
    end
end
