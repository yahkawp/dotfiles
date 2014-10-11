psgrep(){
    local name=$1
    ps aux | perl -n -e " /$name/i && !/grep $name/ &&  print"
}


repl() {
    list=$@;
    string="${(j: :)list}"
    tmux send-keys -t main:0.0 $string Enter
}


