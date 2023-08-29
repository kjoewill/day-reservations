Rails.application.routes.draw do
  root 'home#index'

  resources :assets, path: 'assetz' do
    resources :day_schedules, shallow: true do
      get 'reserve', on: :collection
    end
    get 'day_schedules/:selected_date/edit', to: 'day_schedules#edit', as: 'edit_day_schedule', on: :collection
  end

  resources :day_schedules, only: [] do
    resources :reservations, only: [:edit, :update], as: 'day_schedule_reservations', controller: 'day_schedules/reservations'
  end

  resources :comments, only: [:update]
end