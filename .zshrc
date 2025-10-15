# Custom Commands
alias generate-secret="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'
alias generate-rsa-key='openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:4096 && openssl enc -aes-256-cbc -salt -in private_key.pem -out private_key.enc && openssl rsa -pubout -in private_key.pem -out public_key.pem'
alias create-audiobook='read -p "Title of the audiobook: " title && read -p "Author of the audiobook: " author && read -p "Cover image name: " cover && ls *.mp3 | sort | awk '{print "file \x27" $0 "\x27"}' > files.txt && cat files.txt && ffmpeg -f concat -safe 0 -i files.txt -i "${cover}" -map 0:a -map 1:v -c:a aac -b:a 128k -c:v copy -metadata title="${title}" -metadata author="${author}" -metadata:s:v comment="Cover (front)" -disposition:v attached_pic output.m4b'

# PSQL
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH