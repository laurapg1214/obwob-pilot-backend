Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # set app root
  # root 'TBD' 

  # nesting all CRUD routes under namespace (adds /api in front of all routes)
  namespace :api do
    # EVENTS
    resources :events, only: [:index]
      # resources :questions, only: [:index] do
      #   # route for pushing question to participants
      #   post 'push', on: :member
      #   # route for answer submission
      #   resources :answers, only: [:index, :create]
    # end

    ### v3 ###
    ## TODO: revisit whether assign is an update or sep function ##
    ## displaying, creating, assigning & updating questions (active/inactive, assigned/unassigned)
    # resources :questions, only: [:index, :create, :update, :assign]
  end 
  
  # REDIRECT ALL ROUTES TO ROOT
  get '*path' => redirect('/')
end
