class Task < ActiveRecord::Base
  validates :title, presence: :true
  belongs_to :user

  # def self.task_cant_be_completed_in_future
  #     unless task.completed_at <= Date.now
  #     flash[:notice]= "The task completion date can't be in future date!"
  #   end
  # end

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
