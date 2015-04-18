Rails.application.routes.draw do
  root 'home#index'
  get 'palettes' => 'palettes#index'
  get 'palettes/custom_palette' => 'palettes#custom_palette'
end
