#!/bin/bash

set -e  # exit on error
echo "Start creating the enviroment in the VM for MultiLLM library"
sudo rm -rf /root/.pyenv
# -------------------------
# Make apt fully non-interactive (fix tzdata prompt)
# -------------------------
export DEBIAN_FRONTEND=noninteractive


# -------------------------
# Update apt packages
# -------------------------
sudo apt update -y

# -------------------------
# Install tzdata (non-interactive)
# -------------------------
sudo DEBIAN_FRONTEND=noninteractive apt install -y tzdata

# Set timezone to UTC to avoid prompts
sudo ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime
sudo dpkg-reconfigure -f noninteractive tzdata


# -------------------------
# Install basic dependencies
# -------------------------
sudo apt install -y curl git build-essential \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget llvm libncursesw5-dev \
    xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# -------------------------
# Install pip (Python package manager)
# -------------------------
sudo apt install -y python3-pip

# -------------------------
# Install ffmpeg
# -------------------------
echo "Installing ffmpeg for whisper..."
sudo apt install -y ffmpeg
echo "Successfully installed ffmpeg."


# -------------------------
# Install pyenv
# -------------------------
curl https://pyenv.run | bash

#########################################################################################################
# -------------------------
# Configure pyenv and pipenv in current session
# -------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:$HOME/.local/bin"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

# Also add to shell config files for persistence
if ! grep -q 'PYENV_ROOT' ~/.bashrc; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi
#########################################################################################################


# -------------------------
# Install Python 3.11 using pyenv
# -------------------------
pyenv install 3.11.13
pyenv global 3.11.13   # Set Python 3.11 globally

# -------------------------
# Install pipenv
# -------------------------
sudo apt install -y pipx
pipx install pipenv


# # -------------------------
# # Install Ollama
# # -------------------------
curl -fsSL https://ollama.com/install.sh | sh

# -------------------------
# Pull qwen0.6 model
# -------------------------
# -------------------------
# Start Ollama server
# -------------------------
echo "Starting Ollama server..."
ollama serve &

# Wait until the server is responding
echo "Waiting for Ollama server to start..."
until curl -s http://127.0.0.1:11434/health; do
    sleep 1
done

echo "Ollama server is running in the background."
sleep 5  # small delay to ensure server is fully ready

echo "Downloading Qwen model from Ollama."
ollama pull qwen3:0.6b

# # -------------------------
# # Make pyenv and pipenv immediately available
# # -------------------------


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:$HOME/.local/bin"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"
pipx ensurepath  # optional, ensures pipenv is found in future shells


## Verify they work (optional)
echo "Pyenv version: $(pyenv --version)"
echo "Pipenv version: $(pipenv --version)"

echo "Setup completed successfully !!"
