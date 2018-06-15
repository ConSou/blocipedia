class WikisController < ApplicationController

  before_action :authenticate_user!

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Your wiki was saved"
      redirect_to @wiki
    else
      flash[:alert] = "There was a problem"
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Your wiki has been updated"
      redirect_to @wiki
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "Your wiki was removed successfully"
      redirect_to wikis_path
    else
      flash[:alert] = "There was a problem"
      render :show
    end
  end

end
