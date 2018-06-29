class WikisController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
     @wikis = policy_scope(Wiki)

  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki = Wiki.create(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Your wiki was saved"
      redirect_to @wiki
    else
      render :new
    end
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki

    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Your wiki has been updated"
      redirect_to @wiki
    else
      render :edit
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    @available_users = User.where.not(id: collab_ids.each {|e| e})
    authorize @wiki
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "Your wiki was removed successfully"
      redirect_to wikis_path
    else
      flash[:alert] = "There was a problem"
      render :show
    end
  end

  def private_wikis
    @wikis = Wiki.all
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def collab_ids
    arr = []
    @wiki.collaborators.each do |collab|
       arr.push(collab.user_id)
    end
    arr.push(current_user.id)
    return arr
  end

end
