status is-login; and begin
    # Login shell initialisation

end

status is-interactive; and begin

    bind \cH backward-kill-word

    test -f "/Users/benjamin/.ghcup/env"; and source "/Users/benjamin/.ghcup/env" # ghcup-env
    # Aliases
    alias :q exit
    alias eza 'eza -l --sort type --no-permissions --no-user --no-time --header --icons --no-filesize --group-directories-first'
    alias f 'fzf --preview '\''bat --color=always --style=numbers --line-range=:500 {}'\'''
    alias ga 'git add'
    alias gb 'git branch'
    alias gc 'git commit'
    alias gch 'git checkout'
    alias gr 'git reset --soft HEAD~1'
    alias gs 'git status'
    alias j just
    alias l eza
    alias lg lazygit
    alias ll eza
    alias o ouch
    alias oc 'ouch c'
    alias od 'ouch d'
    alias ol 'ouch l'
    alias bi 'brew install'
    alias bs 'brew search'
    alias q exit
    alias rg rga
    alias md mkdir
    # Interactive shell initialisation
    rg --generate=complete-fish | source
    zoxide init fish | source
    starship init fish | source

    set fish_greeting

    fish_vi_key_bindings

    function killOnLocalPort
        set port $argv[1]
        sudo kill -9 (lsof -- -t -i:$port -sTCP:LISTEN)
    end

    function init_repo
        gh repo create --public benjamin-voca/(basename (pwd))
        git remote add origin git@github.com:benjamin-voca/(basename (pwd)).git
        git push
    end
    set -gx PATH "/usr/local/opt/openjdk/bin:$PATH"
    fish_add_path -ag ~/.config/composer/vendor/bin
    set -gx CPPFLAGS -I/usr/local/opt/openjdk/include
    set -gx EDITOR /usr/local/bin/hx
end

# pnpm
set -gx PNPM_HOME "/Users/benjamin/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
