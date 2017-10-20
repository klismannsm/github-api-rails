require 'rails_helper'

RSpec.describe GithubApi::TrendingRepositories do
  describe 'get' do
    context 'after importing the repository for a certain language' do
      let(:search) { double(:search) }
      let(:search1) { double(:search1, by_language: [1, 2]) }
      let(:search2) { double(:search2, by_language: [3, 4]) }
      let(:importer) { double(:importer) }
      let(:importer1) { double(:importer1, import: [1, 2]) }
      let(:importer2) { double(:importer2, import: [3, 4]) }
      let(:languages) { ['lang1', 'lang2'] }

      subject { described_class.new(languages, search, importer) }

      it 'adds an object with the language and the import result' do
        allow(search).to receive(:new).with(language: languages[0]).and_return(search1)
        allow(search).to receive(:new).with(language: languages[1]).and_return(search2)
        allow(importer).to receive(:new).with([1, 2]).and_return(importer1)
        allow(importer).to receive(:new).with([3, 4]).and_return(importer2)
        result = subject.get
        expect(result[0][:language]).to eq(languages[0])
        expect(result[0][:records]).to eq([1, 2])
        expect(result[1][:language]).to eq(languages[1])
        expect(result[1][:records]).to eq([3, 4])
      end
    end
  end
end
