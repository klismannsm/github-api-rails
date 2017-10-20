module GithubApi
  class Search
    def initialize(options)
      @options = options
    end

    def by_language
      search_repositories_by_language
    end

    private

    def base_url
      'https://api.github.com'
    end

    def search_endpoint
      '/search/repositories?q=language:'
    end

    def base_options
      '&sort=stars&order=desc'
    end

    def search_repositories_by_language_url
      base_url + search_endpoint + @options[:language] + base_options
    end

    def search_repositories_by_language
      JSON.parse(RestClient.get(search_repositories_by_language_url))
    end
  end
end
