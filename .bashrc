# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"

PATH=~/.console-ninja/.bin:$PATH

alias generate-password="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'
alias perseverance-tracker='[ ! -d ~/Applications/PerseveranceTracker ] && git clone https://github.com/aguilarcarboni/perseverance-tracker.git ~/Applications/PerseveranceTracker; cd ~/Applications/PerseveranceTracker && [ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt && python run.py'

export PATH="/Library/TeX/texbin:$PATH"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"
