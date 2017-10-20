module GithubApi
  class Importer
    def initialize(repositories)
      @repositories = repositories
    end

    def import
      GithubRepository.create(repositories_attributes)
    end

    private

    def repositories_attributes
      [].tap do |repositories_attributes|
        @repositories['items'].each do |repository|
          unless repository_exists?(repository['id'])
            repositories_attributes << normalize_repository_attributes(repository)
          end
        end
      end
    end

    def normalize_repository_attributes(attributes)
      repository_owner = owner(attributes['owner']['id'])
      if repository_owner.blank?
          attributes['github_repository_owner_attributes'] = normalize_owner_attributes(attributes['owner'])
      else
        attributes['github_repository_owner_id'] = repository_owner.id
      end
      attributes.delete('owner')
      attributes['github_id'] = attributes.delete('id')
      attributes['github_created_at'] = attributes.delete('created_at')
      attributes['github_updated_at'] = attributes.delete('updated_at')
      attributes
    end

    def normalize_owner_attributes(attributes)
      attributes['github_login'] = attributes.delete('login')
      attributes['github_id'] = attributes.delete('id')
      attributes['user_type'] = attributes.delete('type')
      attributes
    end

    def repository_exists?(github_id)
      GithubRepository.find_by_github_id(github_id)
    end

    def owner(owner_github_id)
      GithubRepositoryOwner.find_by_github_id(owner_github_id)
    end
  end
end
