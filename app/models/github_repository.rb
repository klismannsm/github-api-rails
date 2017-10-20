class GithubRepository < ActiveRecord::Base
  belongs_to :github_repository_owner

  accepts_nested_attributes_for :github_repository_owner

  class << self
    def find_by_github_id(github_id)
      where(github_id: github_id).first
    end

    def search(search_parameter, _)
      return all unless search_parameter.present?
      search_parameter = "%#{search_parameter.downcase}%"
      all.where('LOWER(name) like ? OR LOWER(language) like ?', search_parameter, search_parameter)
    end

    def paginate(organizations, limit, offset)
      organizations.
        order('stargazers_count desc').
        limit(limit).
        offset(offset)
    end
  end
end
