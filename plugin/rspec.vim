" usage:
" (the same as ack, except that the path is required)
" examples: 
" :Ack TODO .
" :Ack sub Util.pm
"
function! AORake(args)
  let rake_output="~/tmp/.rubyrun.spec_output"
  let rake_command="spec " . expand("%") . " 2>&1 \| tee ". rake_output
  execute "!" . rake_command . a:args
  execute "botright sp " . rake_output
  execute "res -10"
endfunction

command! -nargs=* -complete=file AORake call AORake(<q-args>)