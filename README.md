# git-init

#### Setup

this script requires the following env variables to be set:  
GIT_USERNAME with your git username  
GIT_TOKEN with your git personal access token  
These are used when calling the api to create a new repo.

These can be set using  
```
export GIT_USERNAME="<username>"  
export GIT_TOKEN="<token>"
```

Alternatively, you can run setup.sh to append the env vars to your .bashrc and set up a bash alias.
```
chmod +x setup.sh
./setup.sh
```

#### Running

Interact with the function with the following syntax:  
```git-init <repo_name> [<public||private>]```

`git-init -h` or `git-init --help` will print the above message