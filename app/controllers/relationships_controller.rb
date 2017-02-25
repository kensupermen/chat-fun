class RelationshipsController < ApplicationController

  def destroy
    relationship = Relationship.find_by_id(params[:id])
    if relationship.delete
      flash[:success] = "Unfriend success"
    end
    redirect_to users_path
  end

  private

 end
