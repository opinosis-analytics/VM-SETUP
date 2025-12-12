# VM Setup for MultiLLM

## Login to VM

    ssh -i ~/.ssh/kavita_gpu.pem kavita@172.210.243.226

## Install nano

    sudo apt update && sudo apt install -y nano

## Create and run the shell script file

1. Create a new shell file vm_setup_for_multillm.sh:

   nano vm_setup_for_multillm.sh
2. Copy the content from this script:

   [vm_setup_for_multillm.sh
   ](./vm_setup_for_multillm.sh)
3. Paste it into the file.
4. Save and exit:

   Press CTRL+O → Enter → CTRL+X

## Make the script executable

    chmod +x vm_setup_for_multillm.sh

## Run the Script

    sudo ./vm_setup_for_multillm.sh

## Refresh the bash

    source ~/.bashrc

## Clone the repos

Now that you have  the necessary setup for using multillm library on  VM , you can now  clone the projects and put them in the same directory ***projects.
Please Note: Before running the code below generate a ssh key from the VM and put it in yor git hub:**

**ssh-keygen -t ed25519 -C your_email@example.com**.** **

For example:

* ssh-keygen -t ed25519 -C "1421015@iub.edu.bd"
* ssh-keygen -t ed25519 -C "[1421015@iub.edu.bd](mailto:1421015@iub.edu.bd "mailto:1421015@iub.edu.bd")" && echo "Paste the key to your github account: [https://github.com/settings/ssh/new](https://github.com/settings/ssh/new "https://github.com/settings/ssh/new")" && cat ~/.ssh/id_ed25519.pub

The command below creates a directory called **projects** and clones the following library inside it : Opinosis-MultiLLM and use_package_multi_llm

    mkdir projects && cd projects &&

    git clone git@github.com:opinosis-analytics/Opinosis-MultiLLM.git &&

    git clone git@github.com:opinosis-analytics/use_package_multi_llm.git

## Run the project use_package_multillm

Now that the enviroment is set up, you can use the multillm library in the use_package_multi_llm repo.

### To Run the Programs Create Pipenv shell:

1. Enter the directory:

        cd  use_package_multi_llm

2. Install packages

        pipenv install -v

3. Enter the shell

        pipenv shell

### Run the script

        python index.py

### To Run Jupyter notebook:


    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''

Open the url [http://localhost:8888/notebooks/notebook/test_oa_multi_llm_package.ipynb](http://localhost:8888/notebooks/notebook/test_oa_multi_llm_package.ipynb)
