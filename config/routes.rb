Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  # set app root
  root 'events#questions' 

  # nesting all CRUD routes under namespace (adds /api in front of all routes)
  namespace :api do
    # EVENTS 
    ### v2 ###
    # resources :events only: [:index]
    
    # QUESTIONS
    # list all questions assigned to an event
    resources :events do
      resources :questions, only: [:index] do
        # route for pushing question to participants
        post 'push', on: :member
      end
    end

    ### v3 ###
    ## TODO: revisit whether assign is an update or sep function ##
    ## displaying, creating, assigning & updating questions (active/inactive, assigned/unassigned)
    # resources :questions, only: [:index, :create, :update, :assign]
    
    # SESSIONS
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'
  end 
  
  # REDIRECT ALL ROUTES TO ROOT
  get '*path' => redirect('/')
end
