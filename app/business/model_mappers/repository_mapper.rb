module ModelMappers
  class RepositoryMapper
    def initialize(actions_renderer)
      @actions_renderer = actions_renderer
    end

    def map(repository)
      repository = GithubRepositoryDecorator.decorate(repository)
      {
        id: repository.id,
        github_id: repository.github_id,
        name: repository.name,
        language: repository.language,
        stargazers_count: repository.stargazers_count,
        actions: @actions_renderer.call(repository)
      }
    end
  end
end
