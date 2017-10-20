Rails.application.routes.draw do
  root to: 'github_repositories#index'
  get 'github_repositories/repository_list' => 'github_repositories#repository_list', defaults: { format: 'json' }
  get 'github_repositories/import' => 'github_repositories#repository_search'
  get 'github_repositories/destroy_all' => 'github_repositories#destroy_all'

  resources :github_repositories, only: [:index, :show]
end
