module ApplicationHelper
  MALE = { value: true, display_name: 'Male' }
  FEMALE = { value: false, display_name: 'Female' }

  def self.get_gender_dropdown
    { MALE[:display_name] => MALE[:value], FEMALE[:display_name] => MALE[:value] }
  end
end
