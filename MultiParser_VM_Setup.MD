# VM Setup for Multiparser

## Note: First create the environment to use MultiLLM library

Multiparser uses the library MultiLLM. So follow the instructions in readme [MultiLLM_VM_Setup.MD](./MultiLLM_VM_Setup.MD) before using Multiparser.

## Create and run the shell script file

1. Create a new shell file vm_setup_for_multiparser.sh:

   nano vm_setup_for_multiparser.sh

2. Copy the content from this script: [vm_setup_for_multiparser.sh
   ](./vm_setup_for_multiparser.sh)

3. Paste it into the file you opened with nano.

4. Save and exit:

    Press CTRL+O → Enter → CTRL+X

## Make the script executable

    chmod +x vm_setup_for_multiparser.sh

## Run the Script

    sudo ./vm_setup_for_multiparser.sh

## Refresh the bash

    source ~/.bashrc

## Clone the repos

Now that you have  the necessary setup for using both multillm and multiparser library on VM , you can now  clone the projects and put them in the same directory ***projects.**

Please Note: If you have not already created a ssh key on your VM and set it up on your Github account, run the code below to generate a ssh key from the VM and put it in yor github:

**ssh-keygen -t ed25519 -C your_email@example.com**.

For example:

    ssh-keygen -t ed25519 -C "[1421015@iub.edu.bd](1421015@iub.edu.bd)"

Now go to the projects directory where you already have the repos Opinosis-MultiLLM and use_package_multi_llm and clone multiparser repo

    cd projects &&

    git clone git@github.com:opinosis-analytics/Opinosis-MultiParser.git


## Run the project use_package_multillm

Now that the enviroment is set up, you can use the multiparser library in the use_package_multi_llm repo.

### To Run the Programs Create Pipenv shell:

1. Enter the directory:

   cd use_package_multi_llm

2. Install packages

   pipenv install -v

3. Enter the shell

   pipenv shell



### To Run Jupyter notebook:

    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''

Open the url:

[http://localhost:8888/notebooks/notebook/test_oa_multi_parser_package.ipynb](http://localhost:8888/notebooks/notebook/test_oa_multi_parser_package.ipynb)