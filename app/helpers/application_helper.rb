module ApplicationHelper

  def sortable(new_parameter)
    if new_parameter == sort_param
      css_class = (sort_direction == "asc") ? "glyphicon glyphicon-circle-arrow-up" : "glyphicon glyphicon-circle-arrow-down"
      direction = (sort_direction == "asc") ? "desc" : "asc"
    else
      css_class = (sort_direction == "asc") ? "glyphicon glyphicon-circle-arrow-down" : "glyphicon glyphicon-circle-arrow-up"
      direction = (sort_direction == "asc") ? "asc" : "desc"
    end
    link_to "", stats_path(:sort => new_parameter, :direction => direction, :search => search_param), class: css_class
  end
end
