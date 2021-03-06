module ApplicationHelper
  #return a link with the sort and direction params sanitize by @sort_column and @sort_direction in client_controller
  #title can be nil if is nil it will use the column name for the link name
  def sortable(column, title = nil)
    title ||= column.titleize
    direction =  sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title , params.merge(sort: column, direction: direction, page: nil)
  end

end
