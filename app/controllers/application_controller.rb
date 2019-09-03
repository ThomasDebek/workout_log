class ApplicationController < ActionController::Base

  def is_there_something?(something)
    if something
      true
    else
      false
    end
  end

end
