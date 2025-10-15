PATH=~/.console-ninja/.bin:$PATH

alias generate-password="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'
alias perseverance-tracker='[ ! -d ~/Applications/PerseveranceTracker ] && git clone https://github.com/aguilarcarboni/perseverance-tracker.git ~/Applications/PerseveranceTracker; cd ~/Applications/PerseveranceTracker && [ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt && python run.py'
alias create-audiobook='read -p "Title of the audiobook: " title && read -p "Author of the audiobook: " author && read -p "Cover image name: " cover && ls *.mp3 | sort | awk '{print "file \x27" $0 "\x27"}' > files.txt && cat files.txt && ffmpeg -f concat -safe 0 -i files.txt -i "${cover}" -map 0:a -map 1:v -c:a aac -b:a 128k -c:v copy -metadata title="${title}" -metadata author="${author}" -metadata:s:v comment="Cover (front)" -disposition:v attached_pic output.m4b'

export PATH="/Library/TeX/texbin:$PATH"