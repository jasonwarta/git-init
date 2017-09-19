# git-init

this script requires the following env variables to be set

GIT_USERNAME with your git username  
GIT_TOKEN with your git personal access token  

these can be set using  
```
export GIT_USERNAME="<username>"  
export GIT_TOKEN="<token>"
```

these are used when calling the api to create a new repo

place the function code and env vars in your .bashrc or .profile

interact with the function with the following syntax:  
```git-init <repo_name> [<public||private>]```

`git-init -h` or `git-init --help` will print the above message