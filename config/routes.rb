Rails.application.routes.draw do
 root 'sessions#login'
  get '/tasks' => 'tasks#index'
  get '/tasks/new' => 'tasks#new'
  post '/tasks' => 'tasks#create'
  get 'tasks/:id', to: 'tasks#show', as:'task'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'task_edit'
  patch '/tasks/:id/completed', to: 'tasks#completed', as: 'task_completed'
  patch '/tasks/:id' => 'tasks#update'
  delete 'tasks/:id' =>'tasks#destroy'

  get "/auth/:provider/callback" =>  "sessions#create"
  get "/sessions/login_failure", to: "sessions#login_failure", as: "login_failure"

  get "/sessions", to: "sessions#index", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
end
