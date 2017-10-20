module GithubApi
  class TrendingRepositories
    def initialize(languages)
      @languages = languages
    end

    def get
      [].tap do |result|
        @languages.each do |language|
          repositories = Search.new(options(language)).by_language
          result << { language: language, records: Importer.new(repositories).import }
        end
      end
    end

    private

    def options(language)
      { language: language }
    end
  end
end
