class GitHubAlfred
  GITHUBDOTCOM = 'https://github.com'
  DEFAULT_USER = 'github'

  def initialize(p)
    @command = p.to_s.strip
  end

  def open
    `open #{url}`
  end

  def url(command = @command)
    return GITHUBDOTCOM if command.empty?

    if command.split.count == 2
      command, issue = command.split
    end

    if command.split('/').count == 2
      user, repo = command.split('/')
    else
      repo = command
    end

    url_for user, repo, issue
  end

  private

  def url_for(user, repo, issue)
    url = [GITHUBDOTCOM, user || DEFAULT_USER, repo]
    url << ['issues', issue] if issue

    url.join '/'
  end
end

GitHubAlfred.new("{query}").open unless ENV['TESTING'] == 'true'
