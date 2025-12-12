# VM Setup for MultiLLM

## Login to VM 
ssh -i ~/.ssh/kavita_gpu.pem kavita@172.210.243.226 

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

## Clone the repo [/use_package_multi_llm](https://github.com/opinosis-analytics/use_package_multi_llm)

Read the instructions on its [Readme](https://github.com/opinosis-analytics/use_package_multi_llm/blob/main/README.MD#2-run-script) on how to run the script and notebook