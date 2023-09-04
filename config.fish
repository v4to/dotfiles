set -gx NVM_DIR ~/.nvm
#set fish_greeting
set -gx  LC_ALL en_US.UTF-8
set PATH ~/bin $PATH
set PATH /Applications/CMake.app/Contents/bin $PATH
set PATH /Users/andrew/Library/Python/3.9/bin $PATH

# set folders colors in ls command output
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# configure clang
    #set -gx CC clang
    #set -gx CFLAGS "-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
    #set -gx LDLIBS "-lcs50 -lm"
	#set -gx LIBRARY_PATH /usr/local/lib
####################################################################################################





####################################################################################################
#function cdll
#    cd $argv; and tree -a -L 1 -D
#end
function cdll
    cd $argv; ls
end

function mkdirf
    set path $argv[1]
    set list (string split / $path)
    set fileName $list[-1]
    set folders $list[1..-2]
    mkdir -p $folders
    cd $folders
    touch $fileName
    subl .
end

function newprojectspa --argument-names 'folder'
    if test -n "$folder"
        cd ~/Developer
        if test -d "$folder"
            rm -rf "$folder"
        end
        git clone git@github.com:humble-timon/webpack-boilerplate.git "$folder"
        cd $argv
	    rm -rf .git/
	    webstorm .
	    npm i
    else
        echo 'No arguments'
    end
end

function newprojectweb --argument-names 'folder'
    if test -n "$folder"
        cd ~/Developer
        if test -d "$folder"
            rm -rf "$folder"
        end
        git clone git@github.com:humble-timon/gulp-boilerplate.git "$folder"
        cd $argv
	rm -rf .git/
	webstorm .
	npm i
    else
        echo 'No arguments'
    end
end

function gitlog
    git log --oneline --all --graph --pretty="%C(#00f769)%h%C(auto)%d%n%C(green bold)%<(17)Author: %C(white)%an Message: %C(#62d6e8)%s %C(white)=> %C(white)%ar(%ad) %n%C(magenta bold)%<(15)Comitter: %C(white)%cn Message: %C(#62d6e8)%s %C(white)=> %C(white)%cr(%cd)"
end

function mdp
    mkdir -p $argv
    cdll $argv
end

function pd
    if test -d $argv[1]
        tree -a $argv[1] -D -L 1
    else
        tree -a $argv[2] -D -L $argv[1]
    end
end

function reduceVideoSize
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.mp4"
    ffmpeg -i $argv[1] -vcodec libx264 -crf 24 $newFileName
end
function reduceVideoSizeWebm
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.webm"
    ffmpeg -i $argv[1] -vcodec libvpx-vp9 -crf 49 $newFileName
end
function reduceVideoSizeLow
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.mp4"
    ffmpeg -i $argv[1] -vcodec libx264 -crf 40 $newFileName
end
function reduceVideoSizeLowWithSubtitles
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.mp4"
    ffmpeg -i $argv[1] -map 0 -vcodec libx264  -c:a aac -c:s mov_text -crf 40 $newFileName
end
function reduceVideoSizeWithSubtitles
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.mp4"
    ffmpeg -i $argv[1] -map 0 -vcodec libx264 -c:a aac -c:s mov_text -crf 24 $newFileName
end
function reduceVideoSizeWithSubtitlesMkv
    set newFileName (string split -r -m1 . $argv[1])[1]"reduce.mkv"
    ffmpeg -i $argv[1] -map 0 -c:a ac3 -c:s subrip -crf 24 $newFileName
end
####################################################################################################





####################################################################################################
#bobthefish
set -g theme_display_date no
set -g theme_display_git_default_branch yes
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0
set -g theme_color_scheme nord

####################################################################################################





####################################################################################################
alias fishconfig='vim ~/.config/fish/config.fish'
alias ls='colorls -al --gs'
alias dev='cdll ~/Developer'
alias kapchan='cdll /Users/andrew/Developer/projects/iOS/Kapchan'
alias aad='cd ~/Developer/work/AAD/alan-admin-dashboard'
alias src='source ~/.config/fish/config.fish'
alias jsru='cd /Users/andrew/Developer/[learnjavasctiptru]\ Полный\ курс\ по\ React.JS/js_ru_08_06_17'
alias cmdb='open ~/Books/cmd.pdf'
alias down='cdll /Volumes/Data/Downloads/'
alias c2='open ~/Books/the_c_programming_language_2.pdf'
alias css='open ~/Books/css.pdf'
alias vimconfig='vim ~/.vimrc'
alias cs50='cdll ~/Developer/cs50'
alias grammar='open /Users/andrew/Books/Murphy\ R.\ English\ Grammar\ in\ Use.\ 2012\ 4-ed..pdf'
##alias gcc='gcc-12'
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

##setenv GL_ENABLE_DEBUG_ATTACH YES
status --is-interactive; and source (rbenv init -|source)
