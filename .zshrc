# Custom Commands
alias generate-secret="openssl rand -base64"
alias python-start='[ ! -d "venv" ] && python3 -m venv venv; source venv/bin/activate && pip install -r requirements.txt'

generate-rsa-key-pair() {
  local private_file="${1:-}"
  local public_file="${2:-}"

  if [[ -z "$private_file" ]]; then
    read "private_file?Private key output filename [private_key.pem]: "
    [[ -z "$private_file" ]] && private_file="private_key.pem"
  fi

  if [[ -z "$public_file" ]]; then
    read "public_file?Public key output filename [public_key.pem]: "
    [[ -z "$public_file" ]] && public_file="public_key.pem"
  fi

  openssl genpkey -algorithm RSA -out "$private_file" -pkeyopt rsa_keygen_bits:4096 && \
    openssl rsa -pubout -in "$private_file" -out "$public_file"
}

encode-rsa-key() {
  local input_file="${1:-}"
  local output_file="${2:-}"

  if [[ -z "$input_file" ]]; then
    read "input_file?Private key filename to encode [private_key.pem]: "
    [[ -z "$input_file" ]] && input_file="private_key.pem"
  fi

  if [[ -z "$output_file" ]]; then
    read "output_file?Output encrypted filename [private_key.enc]: "
    [[ -z "$output_file" ]] && output_file="private_key.enc"
  fi

  openssl enc -aes-256-cbc -salt -in "$input_file" -out "$output_file"
}

decode-rsa-key() {
  local input_file="${1:-}"
  local output_file="${2:-}"

  if [[ -z "$input_file" ]]; then
    read "input_file?Encrypted key filename to decode [private_key.enc]: "
    [[ -z "$input_file" ]] && input_file="private_key.enc"
  fi

  if [[ -z "$output_file" ]]; then
    read "output_file?Output decrypted filename [private_key.pem]: "
    [[ -z "$output_file" ]] && output_file="private_key.pem"
  fi

  openssl enc -d -aes-256-cbc -in "$input_file" -out "$output_file"
}
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