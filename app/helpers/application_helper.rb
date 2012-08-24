module ApplicationHelper
  def notice
    flash[:notice]
  end

  def error
    flash[:error]
  end
end
