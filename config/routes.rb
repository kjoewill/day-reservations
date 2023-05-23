Rails.application.routes.draw do
  get 'day_schedules/modify'
  root 'home#index'
  resources :assets do
    resources :day_schedules, shallow: true do
      get 'modify', on: :member
    end
  end

  # Define a custom route specifically for modify action
  get 'assets/:asset_id/day_schedules/:date/modify', to: 'day_schedules#modify', as: 'modify_asset_day_schedule'

  # Your other routes...
end