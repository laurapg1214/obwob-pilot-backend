Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  # set app root
  root 'events#questions' 

  # nesting all CRUD routes under namespace (adds /api in front of all routes)
  namespace :api do
    # EVENTS 
    ### v2 ###
    # resources :events only: [:index]
    
    # QUESTIONS, EVENT QUESTIONS
    ### v2 ###
    ### DELETE FOR V3 HANDLED IN RESOURCES ###
    # resources :event_questions, only: [:index]

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
