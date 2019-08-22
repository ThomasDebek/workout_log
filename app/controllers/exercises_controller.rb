class ExercisesController < ApplicationController
  before_action :set_workout

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(workout_params)
    if @exercise.save
      redirect_to workout_path(@workout)
    else
      redirect_to workout_path(@workout)
      flash[:notice] = "Somethig is wrong. Please try again"
    end
  end


  def edit
    @exercise = @workout.exercises.find(params[:id])
  end

  def update
    @exercise = @workout.exercises.find(params[:id])
    if @exercise.update(:workout_params)
      redirect_to workout_path(@workout)
      flash[:notice] = "Exercises successfully updated"
    else
      render action: 'edit'
    end
  end

  def destroy
    @exercise = @workout.exercises.find(params[:id])
    if @exercise.destroy
      redirect_to workout_path(@workout)
      flash[:notice] = "Exercises successfully deleted"
    else
      redirect_to workout_path(@workout)
      flash[:notice] = "Somthing is wrong, please try again"
    end
  end

  private

  def workout_params
    params.require(:exercise).permit(:name, :sets, :reps)
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

end


