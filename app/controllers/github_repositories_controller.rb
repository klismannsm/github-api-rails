class GithubRepositoriesController < ApplicationController
  def index
  end

  def show
    prepare_github_repository_for_showing(github_repository_from_parameter)
  end

  def repository_search
    @repositories = GithubApi::TrendingRepositories.new(languages).get
    redirect_to github_repositories_path
  end

  def repository_list
    respond_to do |format|
      format.json { render json: repositories_list_data }
    end
  end

  def destroy_all
    GithubRepository.destroy_all
    redirect_to github_repositories_path
  end

  private

  def languages
    ['python', 'ruby', 'c%23', 'javascript', 'elixir']
  end

  def prepare_github_repository_for_showing(repository)
    @github_repository = GithubRepositoryDecorator.decorate(repository)
  end

  def github_repository_from_parameter
    GithubRepository.find(params[:id])
  end

  def repositories_list_data
    mapper = ModelMappers::RepositoryMapper.new(repository_actions)
    @repositories = DatatablesRecordsMapper::Mapper
      .new(GithubRepository, params, mapper)
      .mapped_records
  end

  def repository_actions
    @repository_actions ||= Proc.new do |repository|
      render_to_string('actions', locals: { repository_id: repository.id }, formats: :html, layout: false)
    end
  end
end
