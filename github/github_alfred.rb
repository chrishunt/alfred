class GitHubAlfred
  GITHUBDOTCOM = 'https://github.com'
  OWNEDPRS     = "#{GITHUBDOTCOM}/dashboard/pulls/owned"

  # When no user is specified, we'll use the default user
  DEFAULT_USER = 'github'

  # Repository aliases for those long repo names
  #
  #   'alias' => 'really-long-repo-name'
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
    if command.empty?
      GITHUBDOTCOM
    elsif command == 'prs'
      OWNEDPRS
    else
      parse_url_for command
    end
  end

  private

  def parse_url_for(command)
    if command.split.count == 2
      command, issue = command.split
    end

    if command.split('/').count == 2
      user, repo = command.split('/')
    else
      repo = command
    end

    url_for user, repo_for(repo), issue
  end

  def repo_for(repo)
    REPO_ALIASES.fetch(repo) { repo }
  end

  def url_for(user, repo, issue)
    url = [GITHUBDOTCOM, user || DEFAULT_USER, repo]
    url << ['issues', issue] if issue

    url.join '/'
  end
end

GitHubAlfred.new("{query}").open unless ENV['TESTING'] == 'true'
