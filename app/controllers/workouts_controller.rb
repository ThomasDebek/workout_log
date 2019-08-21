class WorkoutsController < ApplicationController

  before_action :find_workout, only: [:show, :edit, :update, :destroy, :upvote]


  def index
    @workouts = Workout.all.order("created_at DESC")
  end

  def new
    @workout = Workout.new
  end

  def show
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
      flash[:notice] = "Workout successfully created"
    else
      render action: 'new'
    end
  end

  def update
    @workout.update(workout_params)
    if @workout.save
      redirect_to @workout
      flash[:notice] = "Workout successfully Updated"
    else
      render action: 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
    flash[:notice] = "Workout deleted"
  end


  private

  def workout_params
    params.require(:workout).permit(:date, :workout, :mood, :length)

  end

  def find_workout
    @workout = Workout.find(params[:id])
  end

end




