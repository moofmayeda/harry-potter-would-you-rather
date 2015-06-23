module ApplicationHelper

  def sortable(column)
    if column_to_db(column) == sort_column
      css_class = (sort_direction == "asc") ? "glyphicon glyphicon-circle-arrow-up" : "glyphicon glyphicon-circle-arrow-down"
    else
      css_class = nil
    end
    direction = (column_to_db(column) == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to "", stats_path(:sort => column, :direction => direction), class: css_class
  end
end
