class NewsController < ApplicationController

  def show
    @news = News.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @project = Project.find(params[:project_id])
    @news.project = @project

    if @news.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @news = News.find(params[:id])
    project = @news.project
    @news.destroy
    redirect_to project_path(project)
  end

  private

  def news_params
    params.require(:news).permit(:title, :summary, :description, :author_id)
  end

end
