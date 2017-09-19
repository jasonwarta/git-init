if [ $1 == '-h' ] || [ $1 == '--help' ]; then
	echo "Usage:"
	echo "    git-init <repo_name> [<public||private>]"
	return
fi

repo_name="$1"
if [ -z "$2" ] || [ $2 == 'public' ]; then
	private="false"
elif [ "$2" = "private" ]; then
	private="true"
fi

curl -u "$GIT_USERNAME:$GIT_TOKEN" -d "{ \"name\": \"${repo_name}\", \"private\": ${private}, \"has_issues\": true, \"has_projects\": false, \"has_wiki\": false }" -H "Content-Type: application/json" -X POST https://api.github.com/user/repos 2>&1 1>/dev/null &&
echo "Creating \"$repo_name\"" &&
mkdir "$repo_name" && cd "$repo_name" &&
echo "# $repo_name" > README.md &&
git init && 
git add README.md &&
git commit -m "first commit" &&
git remote add origin "git@github.com:$GIT_USERNAME/$repo_name.git" &&
git push -u origin master