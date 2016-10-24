class Task < ActiveRecord::Base
  validates :title, presence: :true

  # validates :description, length: { minimum: 2 },
  #               unless: "description.nil? || description.empty?"

  def task_cant_be_completed_in_future
      unless task.completed_at <= Date.now
      errors.add(:completed_at << 'The task completion date cant be in future date!')
    end
  end

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
