class Task < ActiveRecord::Base

  def date
     @completed_date = created_at.strftime("%m/%d/%Y")
     return @completed_date
   end

  def task_complete
    if completed_at != nil
      true
    else
      false
    end
  end
end
