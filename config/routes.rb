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
    ## revisit assiging from within global questions, & within eventquestions
    ## resource for displaying, creating, assigning & updating questions (active/inactive, assigned/unassigned)
    # resources :questions, only: [:index, :create, :update, :assign]
    ## resource for displaying, creating & updating questions within events (assigned/unassigned, complete/incomplete)
    # resources :event_questions, only: [:index, :create, :update]
    
    # SESSIONS
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'
  end 
  
  # REDIRECT ALL ROUTES TO ROOT
  get '*path' => redirect('/')
end
