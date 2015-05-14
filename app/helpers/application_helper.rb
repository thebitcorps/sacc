module ApplicationHelper
  MALE = { value: true, display_name: 'Male' }
  FEMALE = { value: false, display_name: 'Female' }

  def self.get_gender_dropdown
    { MALE[:display_name] => MALE[:value], FEMALE[:display_name] => MALE[:value] }
  end

  #return a link with the sort and direction params sanitize by @sort_column and @sort_direction in client_controller
  #title can be nil if is nil it will use the column name for the link name
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title , params.merge(sort: column , direction: direction,page: nil)
  end
end
