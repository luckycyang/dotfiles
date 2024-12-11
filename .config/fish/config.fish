set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    source $HOME/.cargo/env.fish
    set -x GUIX_PROFILE $HOME/.config/guix/current
    set -x DOTNET_ROOT "$HOME/.dotnet"
    set -x CANGJIE_HOME "/opt/cangjie"
    set -x PATH "$HOME/.dotnet" {$CANGJIE_HOME}/bin:{$CANGJIE_HOME}/tools/bin:{$GUIX_PROFILE}/bin:{$HOME}/.guix-profile/bin:{$HOME}/.config/emacs/bin $PATH
    set -x LD_LIBRARY_PATH {$CANGJIE_HOME}/tools/lib:{$CANGJIE_HOME}/runtime/lib/linux_x86_64_llvm/
end
set -x OPENAI_API_HOST "demo.voapi.top"
starship init fish | source


