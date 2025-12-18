
## 0. Enable Key Authentication on Server

Check to ensure key authentication is enabled on server.

    sudo nano /etc/ssh/sshd_config

## 1. Generate Keys on Local Machine
Go to your local terminal
  
    ssh-keygen -t rsa -b 4096

Specify location for saving:

    ~/.ssh/vm_key
    
Change mode    

    chmod 600 ~/.ssh/vm_key

## 2. Copy Public Key to VM

Copy the public key to server.

    cat ~/.ssh/vm_key.pub

Log in to server using pwd

    ssh user@ipaddress

Create a file

    vim vm_key.pub

Paste public key from local machine and save.

    echo vm_key.pub >> ~/.ssh/authorized_keys
 
    mv vm_key.pub ~/.ssh/

    chmod 600 vm_key.pub

    chmod 600 authorized_keys

## 3. Login
  
    ssh usern@ip -i ~/.ssh/vm_key


## 4. Create Jupyter Tunnel if Needed
  
      ssh  -i ~/.ssh/vm_key -N -L 3333:localhost:3333 user@123.456.789.10
