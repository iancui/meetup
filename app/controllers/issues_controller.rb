class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
    @comments = @issue.comments
  end

  def destroy
    issue = Issue.find(params[:id])
    issue.destroy
    redirect_to :root
  end
  def new
    if not current_user
      flash.notice = "没有执行此操作的权限，请先登录！"
      redirect_to :root
      return
    else
      @issue = Issue.new(user_id: current_user.id)
    end
  end
  def create
    Issue.create(issue_params)
    redirect_to :root
  end

  def edit
    @issue = Issue.find(params[:id])
  end
  def update
    issue = Issue.find(params[:id])
    issue.update_attributes(issue_params)
    redirect_to :root
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :content,:user_id)
  end


end
