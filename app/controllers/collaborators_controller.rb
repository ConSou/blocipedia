class CollaboratorsController < ApplicationController

  def create

  @wiki = Wiki.friendly.find(params[:wiki_id])
  authorize @wiki

  params[:collaborator][:user].reject!{ |c| c.empty? }.each do |user|
    userAdd = User.find(user)
    @wiki.collaborators.create(user: userAdd)
  end
  flash[:notice] = "Your collaborators have been edited"
  redirect_to @wiki

  end

  def destroy
      @wiki = Wiki.friendly.find(params[:wiki_id])
      user = User.find(params[:id])
      @wiki.collaborators.where(user: user).destroy_all

      flash[:notice] = "#{user.email} has been removed as collaborator"
      redirect_to edit_wiki_path(@wiki)
  end


end
