class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :column_to_db

  def column_to_db(column)
    case column
    when "winning-text"
      "choices.text"
    when "winning-percent"
      "pairs.left_count"
    when "losing-text"
      "choices.text"
    when "losing-percent"
      "pairs.right_count"
    else
      "choices.text"
    end
  end
end
