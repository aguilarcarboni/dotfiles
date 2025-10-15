# Custom Commands
alias generate-secret="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'
alias generate-rsa-key='openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:4096 && openssl enc -aes-256-cbc -salt -in private_key.pem -out private_key.enc && openssl rsa -pubout -in private_key.pem -out public_key.pem'
create-audiobook() {
  # Prompt for metadata (zsh read uses ? prompt syntax)
  read "title?Title of the audiobook: "
  read "author?Author of the audiobook: "
  read "cover?Cover image name: "

  # Build concat list for ffmpeg
  ls *.mp3 | sort | awk '{print "file '\''" $0 "'\''"}' > files.txt
  cat files.txt

  # Generate single .m4b file with cover and metadata
  ffmpeg -f concat -safe 0 -i files.txt -i ${cover} \
    -map 0:a -map 1:v \
    -c:a aac -b:a 128k -c:v copy \
    -metadata title=${title} \
    -metadata artist=${author} \
    -metadata:s:v comment="Cover (front)" \
    -disposition:v attached_pic \
    output.m4b

  # Cleanup
  rm files.txt
}

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH