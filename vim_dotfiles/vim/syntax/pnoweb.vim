runtime! syntax/tex.vim
unlet b:current_syntax
 
syntax include @nowebR syntax/perl.vim
syntax region nowebChunk start="^&lt;&lt;.*&gt;&gt;=" end="^@" contains=@nowebR
 
let b:current_syntax="plnoweb"
