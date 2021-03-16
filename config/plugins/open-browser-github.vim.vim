" Opens current files URL in github.com
" :OpenGithubFile
" Opens current files highlighted place in github.com
" :'<,'>OpenGithubFile
" Opens a specific file in github.com
" :OpenGithubFile PATH/TO/FILE
"
" Opens current repositories Issue #1
" :OpenGithubIssue 1
" Opens a specific repositories Issue #1
" :OpenGithubIssue 1 tyru/open-browser.vim
" Opens current repositories Issue List
" :OpenGithubIssue
" Opens a specific repositories Issue list
" :OpenGithubIssue tyru/open-browser.vim
"
" opens /pulls page when it has no argument. Otherwise, it does entirely the same thing as :OpenGithubIssue since GitHub redirects /issues/1 to /pull/1 if #1 is a Pull Request.
" :OpenGithubPullReq
"
" " Opens current opening file's repository.
" ex) https://{hostname}/{user}/{name}
" :OpenGithubProject

" Opens current opening file's repository.
" ex) https://{hostname}/tyru/open-browser.vim
" :OpenGithubProject tyru/open-browser.vim
