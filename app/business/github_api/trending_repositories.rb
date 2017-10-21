module GithubApi
  class TrendingRepositories
    def initialize(languages, search = Search, importer = Importer)
      @languages = languages
      @search = search
      @importer = importer
    end

    def get
      [].tap do |result|
        @languages.each do |language|
          repositories = @search.new(options(language)).by_language
          result << { language: language, records: @importer.new(repositories).import }
        end
      end
    end

    private

    def options(language)
      { language: language }
    end
  end
end
