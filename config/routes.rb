Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  # SET APP ROOT
  root 'events#questions' 
  
  # EVENTS - v2
  # get 'events'
  # get 'events/:id'
  # get 'events/:id/questions'
  
  # QUESTIONS - v3
  # get 'questions'
  # post 'questions'
  # put 'questions/:id/mark_active'
  # put 'questions/:id/mark_inactive'
  # put 'questions/:id/mark_assigned'
  # put 'questions/:id/mark_unassigned'
  # put 'questions/:id/mark_complete'
  # put 'questions/:id/mark_incomplete'
  
  # SESSIONS
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'
  
  # REDIRECT ALL ROUTES TO ROOT
  get '*path' => redirect('/')
end
