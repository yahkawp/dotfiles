runtime! syntax/perl.vim
unlet b:current_syntax
 
syntax include @nowebR syntax/txt.vim
syntax region nowebChunk start="^&lt;&lt;.*&gt;&gt;=" end="^@@" contains=@nowebR
 
let b:current_syntax="plnoweb"
