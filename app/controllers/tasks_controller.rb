class TasksController < ApplicationController
  def index
    @task_lists = [
        {name: "homework",
        description: "read rails documents",
        completion_status: "yes",
        completion_status_date: "9/28/26"
      },
        {name: "cleaning",
        description: "clean room",
        completion_status: "no",
        completion_status_date: "N/A"},

        {name: "cook",
        description: "cook dinner",
        completion_status: "halfway",
        completion_status_date: "N/A"},
      ]
  end

  def show
    @task = [
        {name: "homework",
        description: "read rails documents",
        completion_status: "yes",
        completion_status_date: "9/27/2016"}]
  end



end
