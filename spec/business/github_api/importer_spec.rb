require 'rails_helper'

RSpec.describe GithubApi::Importer do
  describe 'import' do
    let!(:owner1) { GithubRepositoryOwner.create(github_id: 666, github_login: 'asd') }
    let!(:existing_repository) { GithubRepository.create(github_id: 777, name: 'qwe') }

    let(:repository1_json) do
      {
        "total_count" => 303716,
        "incomplete_results" => false,
        "items" => [
          {
            "id" => 44138334,
            "name" => "EnsageSharp",
            "full_name" => "JumpAttacker/EnsageSharp",
            "owner" => {
              "login" => "JumpAttacker",
              "id" => 10989729,
              "avatar_url" => "https://avatars2.githubusercontent.com/u/10989729?v=4",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/JumpAttacker",
              "html_url" => "https://github.com/JumpAttacker",
              "followers_url" => "https://api.github.com/users/JumpAttacker/followers",
              "following_url" => "https://api.github.com/users/JumpAttacker/following{/other_user}",
              "gists_url" => "https://api.github.com/users/JumpAttacker/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/JumpAttacker/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/JumpAttacker/subscriptions",
              "organizations_url" => "https://api.github.com/users/JumpAttacker/orgs",
              "repos_url" => "https://api.github.com/users/JumpAttacker/repos",
              "events_url" => "https://api.github.com/users/JumpAttacker/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/JumpAttacker/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "private" => false,
            "html_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "description" => "c#",
            "fork" => false,
            "url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp",
            "forks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/forks",
            "keys_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/keys{/key_id}",
            "collaborators_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/collaborators{/collaborator}",
            "teams_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/teams",
            "hooks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/hooks",
            "issue_events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/events{/number}",
            "events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/events",
            "assignees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/assignees{/user}",
            "branches_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/branches{/branch}",
            "tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/tags",
            "blobs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/blobs{/sha}",
            "git_tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/tags{/sha}",
            "git_refs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/refs{/sha}",
            "trees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/trees{/sha}",
            "statuses_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/statuses/{sha}",
            "languages_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/languages",
            "stargazers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/stargazers",
            "contributors_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contributors",
            "subscribers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscribers",
            "subscription_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscription",
            "commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/commits{/sha}",
            "git_commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/commits{/sha}",
            "comments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/comments{/number}",
            "issue_comment_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/comments{/number}",
            "contents_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contents/{+path}",
            "compare_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/compare/{base}...{head}",
            "merges_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/merges",
            "archive_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/{archive_format}{/ref}",
            "downloads_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/downloads",
            "issues_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues{/number}",
            "pulls_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/pulls{/number}",
            "milestones_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/milestones{/number}",
            "notifications_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/notifications{?since,all,participating}",
            "labels_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/labels{/name}",
            "releases_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/releases{/id}",
            "deployments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/deployments",
            "created_at" => "2015-10-12T22:46:04Z",
            "updated_at" => "2017-10-20T19:35:44Z",
            "pushed_at" => "2017-10-20T19:24:39Z",
            "git_url" => "git://github.com/JumpAttacker/EnsageSharp.git",
            "ssh_url" => "git@github.com:JumpAttacker/EnsageSharp.git",
            "clone_url" => "https://github.com/JumpAttacker/EnsageSharp.git",
            "svn_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "homepage" => nil,
            "size" => 19337,
            "stargazers_count" => 45,
            "watchers_count" => 45,
            "language" => "C#",
            "has_issues" => true,
            "has_projects" => true,
            "has_downloads" => true,
            "has_wiki" => true,
            "has_pages" => false,
            "forks_count" => 135,
            "mirror_url" => nil,
            "archived" => false,
            "open_issues_count" => 0,
            "forks" => 135,
            "open_issues" => 0,
            "watchers" => 45,
            "default_branch" => "master",
            "score" => 10.760448
          }
        ]
      }
    end

    let(:existing_repository_json) do
      {
        "total_count" => 303716,
        "incomplete_results" => false,
        "items" => [
          {
            "id" => existing_repository.github_id,
            "name" => "EnsageSharp",
            "full_name" => "JumpAttacker/EnsageSharp",
            "owner" => {
              "login" => "JumpAttacker",
              "id" => 10989729,
              "avatar_url" => "https://avatars2.githubusercontent.com/u/10989729?v=4",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/JumpAttacker",
              "html_url" => "https://github.com/JumpAttacker",
              "followers_url" => "https://api.github.com/users/JumpAttacker/followers",
              "following_url" => "https://api.github.com/users/JumpAttacker/following{/other_user}",
              "gists_url" => "https://api.github.com/users/JumpAttacker/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/JumpAttacker/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/JumpAttacker/subscriptions",
              "organizations_url" => "https://api.github.com/users/JumpAttacker/orgs",
              "repos_url" => "https://api.github.com/users/JumpAttacker/repos",
              "events_url" => "https://api.github.com/users/JumpAttacker/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/JumpAttacker/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "private" => false,
            "html_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "description" => "c#",
            "fork" => false,
            "url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp",
            "forks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/forks",
            "keys_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/keys{/key_id}",
            "collaborators_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/collaborators{/collaborator}",
            "teams_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/teams",
            "hooks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/hooks",
            "issue_events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/events{/number}",
            "events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/events",
            "assignees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/assignees{/user}",
            "branches_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/branches{/branch}",
            "tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/tags",
            "blobs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/blobs{/sha}",
            "git_tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/tags{/sha}",
            "git_refs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/refs{/sha}",
            "trees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/trees{/sha}",
            "statuses_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/statuses/{sha}",
            "languages_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/languages",
            "stargazers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/stargazers",
            "contributors_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contributors",
            "subscribers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscribers",
            "subscription_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscription",
            "commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/commits{/sha}",
            "git_commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/commits{/sha}",
            "comments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/comments{/number}",
            "issue_comment_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/comments{/number}",
            "contents_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contents/{+path}",
            "compare_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/compare/{base}...{head}",
            "merges_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/merges",
            "archive_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/{archive_format}{/ref}",
            "downloads_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/downloads",
            "issues_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues{/number}",
            "pulls_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/pulls{/number}",
            "milestones_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/milestones{/number}",
            "notifications_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/notifications{?since,all,participating}",
            "labels_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/labels{/name}",
            "releases_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/releases{/id}",
            "deployments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/deployments",
            "created_at" => "2015-10-12T22:46:04Z",
            "updated_at" => "2017-10-20T19:35:44Z",
            "pushed_at" => "2017-10-20T19:24:39Z",
            "git_url" => "git://github.com/JumpAttacker/EnsageSharp.git",
            "ssh_url" => "git@github.com:JumpAttacker/EnsageSharp.git",
            "clone_url" => "https://github.com/JumpAttacker/EnsageSharp.git",
            "svn_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "homepage" => nil,
            "size" => 19337,
            "stargazers_count" => 45,
            "watchers_count" => 45,
            "language" => "C#",
            "has_issues" => true,
            "has_projects" => true,
            "has_downloads" => true,
            "has_wiki" => true,
            "has_pages" => false,
            "forks_count" => 135,
            "mirror_url" => nil,
            "archived" => false,
            "open_issues_count" => 0,
            "forks" => 135,
            "open_issues" => 0,
            "watchers" => 45,
            "default_branch" => "master",
            "score" => 10.760448
          }
        ]
      }
    end

    let(:repository_with_existing_owner_json) do
      {
        "total_count" => 303716,
        "incomplete_results" => false,
        "items" => [
          {
            "id" => 44138334,
            "name" => "EnsageSharp",
            "full_name" => "JumpAttacker/EnsageSharp",
            "owner" => {
              "login" => "JumpAttacker",
              "id" => owner1.github_id,
              "avatar_url" => "https://avatars2.githubusercontent.com/u/10989729?v=4",
              "gravatar_id" => "",
              "url" => "https://api.github.com/users/JumpAttacker",
              "html_url" => "https://github.com/JumpAttacker",
              "followers_url" => "https://api.github.com/users/JumpAttacker/followers",
              "following_url" => "https://api.github.com/users/JumpAttacker/following{/other_user}",
              "gists_url" => "https://api.github.com/users/JumpAttacker/gists{/gist_id}",
              "starred_url" => "https://api.github.com/users/JumpAttacker/starred{/owner}{/repo}",
              "subscriptions_url" => "https://api.github.com/users/JumpAttacker/subscriptions",
              "organizations_url" => "https://api.github.com/users/JumpAttacker/orgs",
              "repos_url" => "https://api.github.com/users/JumpAttacker/repos",
              "events_url" => "https://api.github.com/users/JumpAttacker/events{/privacy}",
              "received_events_url" => "https://api.github.com/users/JumpAttacker/received_events",
              "type" => "User",
              "site_admin" => false
            },
            "private" => false,
            "html_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "description" => "c#",
            "fork" => false,
            "url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp",
            "forks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/forks",
            "keys_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/keys{/key_id}",
            "collaborators_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/collaborators{/collaborator}",
            "teams_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/teams",
            "hooks_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/hooks",
            "issue_events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/events{/number}",
            "events_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/events",
            "assignees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/assignees{/user}",
            "branches_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/branches{/branch}",
            "tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/tags",
            "blobs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/blobs{/sha}",
            "git_tags_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/tags{/sha}",
            "git_refs_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/refs{/sha}",
            "trees_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/trees{/sha}",
            "statuses_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/statuses/{sha}",
            "languages_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/languages",
            "stargazers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/stargazers",
            "contributors_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contributors",
            "subscribers_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscribers",
            "subscription_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/subscription",
            "commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/commits{/sha}",
            "git_commits_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/git/commits{/sha}",
            "comments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/comments{/number}",
            "issue_comment_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues/comments{/number}",
            "contents_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/contents/{+path}",
            "compare_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/compare/{base}...{head}",
            "merges_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/merges",
            "archive_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/{archive_format}{/ref}",
            "downloads_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/downloads",
            "issues_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/issues{/number}",
            "pulls_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/pulls{/number}",
            "milestones_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/milestones{/number}",
            "notifications_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/notifications{?since,all,participating}",
            "labels_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/labels{/name}",
            "releases_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/releases{/id}",
            "deployments_url" => "https://api.github.com/repos/JumpAttacker/EnsageSharp/deployments",
            "created_at" => "2015-10-12T22:46:04Z",
            "updated_at" => "2017-10-20T19:35:44Z",
            "pushed_at" => "2017-10-20T19:24:39Z",
            "git_url" => "git://github.com/JumpAttacker/EnsageSharp.git",
            "ssh_url" => "git@github.com:JumpAttacker/EnsageSharp.git",
            "clone_url" => "https://github.com/JumpAttacker/EnsageSharp.git",
            "svn_url" => "https://github.com/JumpAttacker/EnsageSharp",
            "homepage" => nil,
            "size" => 19337,
            "stargazers_count" => 45,
            "watchers_count" => 45,
            "language" => "C#",
            "has_issues" => true,
            "has_projects" => true,
            "has_downloads" => true,
            "has_wiki" => true,
            "has_pages" => false,
            "forks_count" => 135,
            "mirror_url" => nil,
            "archived" => false,
            "open_issues_count" => 0,
            "forks" => 135,
            "open_issues" => 0,
            "watchers" => 45,
            "default_branch" => "master",
            "score" => 10.760448
          }
        ]
      }
    end

    context 'when parsing repository attributes' do
      subject { described_class.new(repository1_json) }

      it 'renames owner reserved properties' do
        repository = subject.import[0]
        expect(repository.github_repository_owner.github_id).to eq(10989729)
        expect(repository.github_repository_owner.github_login).to eq('JumpAttacker')
        expect(repository.github_repository_owner.user_type).to eq('User')
      end

      it 'renames repository reserved properties' do
        repository = subject.import[0]
        expect(repository.github_id).to eq(44138334)
        expect(repository.github_created_at).to eq('2015-10-12T22:46:04Z')
        expect(repository.github_updated_at).to eq('2017-10-20T19:35:44Z')
      end
    end

    context 'when finding existing owner' do
      subject { described_class.new(repository_with_existing_owner_json) }
      it 'does not create another owner' do
        repository = subject.import[0]
        expect(repository.github_repository_owner_id).to eq(owner1.id)
      end
    end

    context 'when finding existing repository' do
      subject { described_class.new(existing_repository_json) }
      it 'does not create another repository' do
        repositories = subject.import
        expect(repositories.count).to eq(0)
      end
    end
  end
end
