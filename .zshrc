# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

PATH=~/.console-ninja/.bin:$PATH

alias generate-password="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'
alias perseverance-tracker='[ ! -d ~/perseverance-tracker ] && git clone https://github.com/aguilarcarboni/perseverance-tracker.git ~/perseverance-tracker; cd ~/perseverance-tracker && [ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt && python run.py'

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
