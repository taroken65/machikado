class Admin::AgesController < ApplicationController
  def index
    @age = Age.new
    @ages = Age.all
  end

  def create
    age = Age.new(age_params)
    age.save
    redirect_to admin_ages_path
  end

  def edit
    @age = Age.find(params[:id])
  end

  def update
   age = Age.find(params[:id])
   age.update(age_params)
   redirect_to admin_ages_path
  end

  private

  def age_params
    params.require(:age).permit(:name)
  end
end
