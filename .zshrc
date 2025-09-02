# Custom Commands
alias generate-secret="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'

# PSQL
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH