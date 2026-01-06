if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
	set -gx PATH $PATH ~/go/bin
	set -gx ANDROID_HOME $HOME/Android/Sdk
	set -gx PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
	set -gx PATH $ANDROID_HOME/platform-tools $PATH
	set -gx PATH $ANDROID_HOME/tools/bin $PATH
	set -gx PATH $ANDROID_HOME/emulator $PATH
end
