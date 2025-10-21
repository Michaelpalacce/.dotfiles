#!/usr/bin/env bash
# Path to the encrypted SSH files
enc_dir="$HOME/.dotfiles/ssh/.ssh"
dec_dir="$HOME/.ssh"

decrypt_file() {
    input=$1
    output=$2
    permissions=$3
    
    sops --output "$output" --age age1mq6usjzvvxvcp7tl03yjdqd0kgjhhvhz48kmg86p43nhx0jc75jssw0kfn --decrypt "$input"
    chmod "$permissions" "$output"
}

# Decrypt the SSH identity files using age and output to the correct location
decrypt_file "$enc_dir/id_rsa.sops" "$dec_dir/id_rsa" 600
decrypt_file "$enc_dir/id_rsa.pub.sops" "$dec_dir/id_rsa.pub" 644

decrypt_file "$enc_dir/id_ed25519.sops" "$dec_dir/id_ed25519" 600
decrypt_file "$enc_dir/id_ed25519.pub.sops" "$dec_dir/id_ed25519.pub" 644