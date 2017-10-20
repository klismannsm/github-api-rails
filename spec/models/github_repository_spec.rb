require 'rails_helper'

RSpec.describe GithubRepository do
  context 'validations' do
    it { is_expected.to belong_to(:github_repository_owner) }

    it { is_expected.to validate_presence_of(:github_id) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
