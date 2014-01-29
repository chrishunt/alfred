# GitHub

Use this workflow to open repositories and issues on [github.com][github] using
Alfred.

## Usage

- `git` Open github.com
- `git repo` Open repo for the default user
- `git user/repo` Open repo for the specified user
- `git repo 5561` Open issue (or pull) 5561 for repo for the default user
- `git user/repo 5561` Open issue (or pull) 5561 for repo for the specified user

## Installation

After you have imported the [workflow][workflow], you can change the default
user by modifying [`DEFAULT_USER`][user] in the workflow script.

[alfred]: http://www.alfredapp.com
[github]: https://github.com
[workflow]: https://github.com/chrishunt/alfred/blob/master/github/GitHub.alfredworkflow?raw=true
[user]: https://github.com/chrishunt/alfred/blob/a3ef11e5ad73a2c71c4e72fafcee477cc0a07b2c/github/github_alfred.rb#L3
