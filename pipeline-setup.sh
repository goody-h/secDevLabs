 #add public key for the multiverse repo which has nikto
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu bionic multiverse'
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu bionic-security multiverse'
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu bionic-updates multiverse'

sudo apt-get update -y
sudo apt-get install -y nikto	
	
#Install virtualenv to isolate each project dependencies
pip install virtualenv
#Install python SCA tool/dependency checker, license check
pip install safety
pip install liccheck
#Install the git history checker for secrets
pip install trufflehog
#Install python SAST tool
pip install bandit

# Used for authenticated DAST scan
pip install selenium

# configure ansible to use right keys and not check host auth for this ephemeral/temp aws host
# Not authenticating existing/long-term hosts requiring relogins may lead to mitm.. be careful
sudo cp ./jenkins/ansible.cfg /etc/ansible/ansible.cfg

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

