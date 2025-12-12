# VM Setup for MultiLLM

## Login to VM

ssh -i ~/.ssh/kavita_gpu.pem kavita@172.210.243.226

## Install nano

    sudo apt update && sudo apt install -y nano

## Create the shell script file

1. Create the shell script file:

   nano vm_setup_for_multillm.sh
2. Copy the content from this script: [vm_setup_for_multillm.sh](./vm_setup_for_multillm.sh)
3. Paste it into the file.
4. Save and exit:

   Press CTRL+O → Enter → CTRL+X

## Make the script executable

    chmod +x vm_setup_for_multillm.sh

## Run the Script

sudo ./vm_setup_for_multillm.sh

## Clone the repos

Now that you have setup VM for usage, now clone the projects and put them in the same directory ***projects. (See the steps here on how to clone the project with ssh key : [Clone projects in VM](https://opinosis-my.sharepoint.com/:w:/g/personal/asif_mahmud_opinosis-analytics_com/IQA6_JMywTVCRqAIloKdIsHLAabMd2FaXIn_fI3eqbv7Ouo?e=5CBAGE&nav=eyJoIjoiMTExMzAyNjQ5OSJ9))***

    mkdir projects &&


    git clone git@github.com:opinosis-analytics/Opinosis-MultiLLM.git &&

    git clone git@github.com:opinosis-analytics/use_package_multi_llm.git


Read the instructions on its [Readme](https://github.com/opinosis-analytics/use_package_multi_llm/blob/main/README.MD#2-run-script) on how to run the script and notebook
