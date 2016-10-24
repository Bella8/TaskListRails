class CompletedDateValidator < ActiveModel::Validator
   def validate(task)
       unless task.completed_at <= Date.now
       task.errors[:completed_at] << 'The task completion date cant be in future date!'
     end
   end
 end
