require 'cgi'

class GitHubAlfred
  GITHUBDOTCOM = 'https://github.com'

  # When no user is specified, we'll use the default user
  DEFAULT_USER = 'github'

  # Repository aliases for those long repo names
  #
  #   'alias' => 'user/really-long-repo-name'
  #   'dots'  => 'dot-files'
  REPO_ALIASES = {
  }

  def initialize(p)
    @command = p.to_s.strip
  end

  def open
    `open #{url}`
  end

  def url(command = @command)
    command, *params = command.split

    if command.to_s.empty?
      GITHUBDOTCOM
    elsif command == 'prs'
      "#{GITHUBDOTCOM}/pulls"
    elsif command == 's'
      "#{GITHUBDOTCOM}/search?q=#{CGI.escape params.join(" ")}"
    else
      repo, user = REPO_ALIASES.fetch(command, command).split('/').reverse

      repo_url_for user, repo, params.first
    end
  end

  private

  def repo_url_for(user, repo, issue)
    url = [
      GITHUBDOTCOM,
      user || DEFAULT_USER,
      repo
    ]

    url << ['issues', issue] if issue

    url.join '/'
  end
end

GitHubAlfred.new("{query}").open unless ENV['TESTING'] == 'true'
