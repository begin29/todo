class TaskListsController < ApplicationController
  load_and_authorize_resource
  # GET /task_lists.json

  has_scope :by_sortable_asc, as: :sort_asc #do |controller, scope, value|
  has_scope :by_sortable_desc, as: :sort_desc
  has_scope :to_task_list, as: :id
  has_scope :by_complete, as: :id do |controller, scope, value|
    scope.by_complete
  end
  
  def index
    
    @task_lists = TaskList.all
    @task_lists = cancan(@task_lists)
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_lists }
    end
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/new
  # GET /task_lists/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_list }
    end
  end

  # GET /task_lists/1/edit
  def edit
    # @task_list = TaskList.find(params[:id])
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    # @task_list = TaskList.new(params[:task_list])

    respond_to do |format|
      if @task_list.save
        format.html { redirect_to @task_list, notice: 'Task list was successfully created.' }
        format.json { render json: @task_list, status: :created, location: @task_list }
      else
        format.html { render action: "new" }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_lists/1
  # PUT /task_lists/1.json
  def update
    # @task_list = TaskList.find(params[:id])

    respond_to do |format|
      if @task_list.update_attributes(params[:task_list])
        format.html { redirect_to @task_list, notice: 'Task list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    # @task_list = TaskList.find(params[:id])
    @task_list.destroy

    respond_to do |format|
      format.html { redirect_to task_lists_url }
      format.json { head :no_content }
    end
  end

  # i dont know what it is
  # def view
    
  #   @task_list = TaskList.find(params[:id])
  #   @tasks = apply_scopes(Task).all
  #   @tasks_complete = Task.where(:complete => true)
    
  # end

  def complete_check
    @current_task = Task.find(params[:task_id])
    @current_task.update_attributes(:complete => params[:type_check] )
    respond_to do |format|
      format.js { render :partial => "current_task",  :locals => {:task => @current_task } }
    end
  end    

  private
  
  def cancan list
    list.each do |task_list| 
      if can? :destroy, task_list
        task_list.cancan = "true"
      end
    end
  end

end
