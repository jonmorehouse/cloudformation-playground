"map <Leader>rr :call Utilities#CleanShell("echo \"HELLO WORLD\"")<CR>

"let command = "aws cloudformation validate-template --template-body \"`cat ". @% ."`\""
"map <Leader>rt :call Utilities#CleanShell(command)<CR>
map <Leader>rb :call Utilities#CleanShell("cake build")<CR>
