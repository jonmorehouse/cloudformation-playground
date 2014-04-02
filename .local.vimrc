let command = "aws cloudformation validate-template --template-body \"`cat ". @% ."`\""
map <Leader>rr :call Utilities#CleanShell("cake test")<CR>
map <Leader>rb :call Utilities#CleanShell("cake build")<CR>
