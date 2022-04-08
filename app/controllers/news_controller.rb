class NewsController < ApplicationController

  def index
    case params[:order]
      when 'alphabetical' then @news = News.order(title: :desc)
      when 'oldest_first' then @news = News.order(created_on: :desc)
      else @news = News.order(created_on: :asc)
    end
  end

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
