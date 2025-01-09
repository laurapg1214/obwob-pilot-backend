Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  # set app root
  root 'events#questions' 

  # nesting all CRUD routes under namespace (adds /api in front of all routes)
  namespace :api do
    # EVENTS 
    ### v2 ###
    # get 'events' => 'events#index'
    # get 'events/:id' => 'events#index_by_current_event'

    # QUESTIONS 
    ### v3 ###
    # get 'questions' => 'questions#index' # all questions across events
    # post 'questions' => 'questions#create'
    
    # EVENT QUESTIONS 
    ### v2 ###
    # get 'events/:id/questions' => 'eventquestions#questions'

    ### v3 ###
    # single resource for updating questions (active/inactive, assigned/unassigned, complete/incomplete)
    # resources :events do
      # resources :questions, only: [:index, :update]
      ## :index → GET /questions → Maps to index, used to list all questions
      ## :update → PUT /questions/:id → Maps to update, used to update a specific question
    # end
    
    # SESSIONS
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'
  end 
  
  # REDIRECT ALL ROUTES TO ROOT
  get '*path' => redirect('/')
end
