ENV['TESTING'] = 'true'

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../github_alfred'

describe GitHubAlfred do
  describe '#url' do
    def url_must_equal(url)
      url = nil if url.empty?

      expected = GitHubAlfred.new(@command).url
      expected.must_equal \
        [GitHubAlfred::GITHUBDOTCOM, url].compact.join '/'
    end

    it '' do
      @command = ''
      url_must_equal ''
    end

    it 'prs' do
      @command = 'prs'
      url_must_equal 'dashboard/pulls/owned'
    end

    it 's query' do
      @command = "s dot's files"
      url_must_equal 'search?q=dot%27s+files'
    end

    it 'repo' do
      @command = 'dotfiles'
      url_must_equal 'github/dotfiles'
    end

    it 'user/repo' do
      @command = 'chris/dotfiles'
      url_must_equal 'chris/dotfiles'
    end

    it 'repo 1234' do
      @command = 'dotfiles 123'
      url_must_equal 'github/dotfiles/issues/123'
    end

    it 'user/repo 1234' do
      @command = 'chris/dotfiles 1234'
      url_must_equal 'chris/dotfiles/issues/1234'
    end
  end
end
