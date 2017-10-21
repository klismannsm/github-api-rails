class GithubRepositoryDecorator < Draper::Decorator
  delegate_all

  def main_attributes
    attributes.except('github_repository_owner_id')
  end

  def label_text(key)
    I18n.t("models.labels.github_repositories.#{key}")
  end
end
