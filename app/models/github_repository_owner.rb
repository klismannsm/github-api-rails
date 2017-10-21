class GithubRepositoryOwner < ActiveRecord::Base
  has_many :github_repositories

  validates_presence_of :github_login, :github_id

  def self.find_by_github_id(github_id)
    where(github_id: github_id).first
  end
end
