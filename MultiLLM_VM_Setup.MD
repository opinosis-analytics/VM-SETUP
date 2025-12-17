# VM Setup for MultiLLM


## Get the Private SSH Key from Azure
Grab and put the private key in the ssh folder and provide permissions to read the SSH key:

    open ~/.ssh

After putting the key in the  ssh folder. Run:

    chmod 600 ~/.ssh/kavita_gpu2.pem

# VM Base Setup

## Login to VM

1. **Simple Login**

        ssh -i ~/.ssh/kavita_gpu.pem kavita@172.210.243.226

2. **SSH tunnel to use jupyter notebook**: 

    Use this command if you want to make a ssh tunnel to your computer. It will **let you use the jupyter notebook from VM to your local machine** :

        ssh -L 8888:localhost:8888 -i ~/.ssh/kavita_gpu2.pem opinosis@20.55.233.67
 
## Install nano

    sudo apt update && sudo apt install -y nano

## Create and run the shell script file

1. Create a new shell file vm_setup_base.sh:

        nano vm_setup_base.sh

2. Copy the content from this script: [vm_setup_base.sh
   ](./vm_setup_base.sh)

3. Paste it into the file you opened with nano.

4. Save and exit:

   Press CTRL+O → Enter → CTRL+X

## Make the script executable

    chmod +x vm_setup_base.sh

## Run the Script

    sudo ./vm_setup_base.sh

## Refresh the bash

    source ~/.bashrc

# Setup Repos - Clone From Scratch

Now that you have  the necessary setup for using multillm library on  VM , you can now  clone the projects and put them in the same directory ***projects.
Please Note: Before running the code below generate a ssh key from the VM and put it in yor git hub:**

**ssh-keygen -t ed25519 -C your_email@example.com**.** **

For example:

    ssh-keygen -t ed25519 -C "ganesan.kavita@gmail.com" 
 
    File to save: /home/sysadmin/.ssh/id_ed25519

    To see the key: cat ~/.ssh/id_ed25519.pub


Paste the key to your github account: https://github.com/settings/ssh/new

Verify that the key is working from your terminal. This should request to add key:

    ssh -T git@github.com


The command below creates a directory called **projects** and clones the following library inside it : Opinosis-MultiLLM and use_package_multi_llm

    mkdir projects 
    
    cd projects

    git clone git@github.com:opinosis-analytics/Opinosis-MultiLLM.git &&

    git clone git@github.com:opinosis-analytics/use_package_multi_llm.git

# Run Scripts

Now that the enviroment is set up, you can use the multillm library in the use_package_multi_llm repo.

## Create Pipenv shell:

1. Enter the directory:

        cd use_package_multi_llm
        
2. Install packages

        pipenv install -v

3. Enter the shell

        pipenv shell

4. Run the script

        python index.py


# Test From Jupyter:

    pipenv shell

    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''

Open the url:

[http://localhost:8888/notebooks/notebook/test_oa_multi_llm_package.ipynb](http://localhost:8888/notebooks/notebook/test_oa_multi_llm_package.ipynb)

# Use Jupyter Notebook On Remote Server

1. Start the remote server 

        pipenv shell

        jupyter notebook --no-browser --port=3333

2. Copy the port `3333`

3. Create a tunnel between local computer and remote server 

        sshpass -p 'password' ssh -N -L 3333:localhost:3333 user@ip_address

    Or:
            
        ssh -N -L 3333:localhost:3333 user@ip_address

4. Copy the full URL from remote server and paste on your browser. Ready to go! Open appropriate notebook

