FactoryGirl.define do
  factory :github_repository_owner, class: GithubRepositoryOwner do
    name 'Owner 1'
    github_id 666
  end
end
