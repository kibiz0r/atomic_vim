" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec,*.thor	set filetype=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant		set filetype=ruby

" IRB config
au BufNewFile,BufRead .irbrc,irbrc			set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			set filetype=eruby

" AORuby
au BufNewFile,BufRead *.spec_output  set filetype=spec_output
