class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def copy
    @problem = Problem.find(params[:id]).dup
    render :new
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(params[:problem])

    if @problem.save
      redirect_to @problem
    else
      render :new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes(params[:problem])
      redirect_to @problem
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path
  end

end
