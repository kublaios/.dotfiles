export PATH="/usr/local/opt/ruby/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
eval "$(rbenv init -)"

# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.7 -sOutputFile="$2" "$1"
}
