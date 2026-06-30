if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
	set -gx PATH $PATH (go env GOPATH)/bin
	set -gx PATH $PATH $HOME/.local/bin
	set -gx PATH $PATH $HOME/Android/Sdk/emulator
	set -gx PATH $PATH /var/lib/flatpak/exports/share/applications/
	starship init fish | source
end

