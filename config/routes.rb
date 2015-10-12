Rails.application.routes.draw do
  root 'home#index'
  get 'palettes' => 'palettes#index'
  get 'palettes/custom' => 'palettes#custom'
end
