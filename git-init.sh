#!/usr/bin/env bash

usage () {
	echo "Usage:"
	echo "    git-init <repo_name> [<public||private>]"
	exit
}

if [ -z "$1" ]; then
	usage
elif [ $1 == '-h' ] || [ $1 == '--help' ]; then
	usage
fi

if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_TOKEN" ]; then 
	echo "You must add environmental variables with your git creds"
	echo "To do this, open your ~/.bashrc or ~/.profile and add the following lines."
	echo "Substitute <username> and <personal_access_token> with your details."
	echo "    export GIT_USERNAME=\"<username>\""
	echo "    export GIT_TOKEN=\"<personal_access_token>\""
	exit
fi

repo_name="$1"
if [ -z "$2" ] || [ $2 == 'public' ]; then
	private="false"
elif [ "$2" = "private" ]; then
	private="true"
fi

curl -u "$GIT_USERNAME:$GIT_TOKEN" -d "{ \"name\": \"${repo_name}\", \"private\": ${private}, \"has_issues\": true, \"has_projects\": false, \"has_wiki\": false }" -H "Content-Type: application/json" -X POST https://api.github.com/user/repos 2>&1 1>/dev/null &&
echo "Creating \"$repo_name\"" &&
mkdir "./$repo_name" && cd "./$repo_name" &&
echo "# $repo_name" > README.md &&
git init && 
git add README.md &&
git commit -m "first commit" &&
git remote add origin "git@github.com:$GIT_USERNAME/$repo_name.git" &&
git push -u origin master