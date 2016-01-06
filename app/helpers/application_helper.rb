module ApplicationHelper
  # Pulic: html_safe a string if the condition is met
  #
  # params
  #
  #  condition  -  The condition to test
  #  str        -  The string
  #
  def html_safe_if(condition, str)
    if condition
      str.html_safe
    else
      str
    end
  end
end
