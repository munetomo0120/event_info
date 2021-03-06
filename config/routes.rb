Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end
  # ルートパスの設定
  root "welcome#index"
  # OmniAuthによる認証が成功した場合は"/auth/:provider/callback"がコールバック用のURLとして利用されるのでログイン用のアクションに紐付け
  get "/auth/:provider/callback" => "sessions#create"
  
  delete "/logout" => "sessions#destroy", as: :logout

  resources :retirements
end
