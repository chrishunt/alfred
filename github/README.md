# GitHub

Use this workflow to open repositories, issues, and pull requests on
[github.com][github] using Alfred.

## Usage

- `git` Open github.com
- `git prs` Show all my open pull requests
- `git repo` Open repo for the default user
- `git user/repo` Open repo for the specified user
- `git repo 5561` Open issue (or pull) 5561 for repo for the default user
- `git user/repo 5561` Open issue (or pull) 5561 for repo for the specified user

## Installation

After you have imported the [workflow][workflow], you can change the default
user by modifying [`DEFAULT_USER`][user] in the workflow script.

If there are repositories that you access frequently, you can create aliases
by adding to [`REPO_ALIASES`][aliases]

[alfred]: http://www.alfredapp.com
[aliases]: https://github.com/chrishunt/alfred/blob/55fb4a9f95a8b5b568bfbefc5976b9c83c69b4bf/github/github_alfred.rb#L7-L12
[github]: https://github.com
[user]: https://github.com/chrishunt/alfred/blob/55fb4a9f95a8b5b568bfbefc5976b9c83c69b4bf/github/github_alfred.rb#L4-L5
[workflow]: https://github.com/chrishunt/alfred/blob/master/github/GitHub.alfredworkflow?raw=true
