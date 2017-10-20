require 'rails_helper'

RSpec.describe GithubRepositoryOwner do
  context 'validations' do
    it { is_expected.to have_many(:github_repositories) }

    it { is_expected.to validate_presence_of(:github_login) }
    it { is_expected.to validate_presence_of(:github_id) }
  end
end
