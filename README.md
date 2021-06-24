# DevSecOps pipeline for Python project

A Jenkins end-to-end DevSecOps pipeline for Python web application, hosted on AWS Ubuntu 18.04

![pipeline](https://user-images.githubusercontent.com/11514346/71473164-e57a5500-27cd-11ea-97cb-3c25f0266407.JPG)

<img alt="psparchitecture" src="https://user-images.githubusercontent.com/11514346/71579758-effe5c80-2af5-11ea-97ae-dd6c91b02312.PNG">

*Disclaimer: This project is for demonstration purpose with surface level checks only, do not use it as-is for production*

> **Checkout project** - check out python application project repository with XSS vulnerability

> **git secret check** - check there is no password/token/keys/secrets accidently commited to project github

> **SCA** - check external dependencies/libraries used by the project have no known vulnerabilities

> **SAST** - static analysis of the application source code for exploits, bugs, vulnerabilites

> **Container audit** - audit the container that is used to deploy the python application

> **DAST** - deploy the application, register, login, attack & analyse it from the frontend as authenticated user

> **System security audit** - analyse at the security posture of the system hosting the application

> **WAF** - deploy application with WAF which will filter malicious requests according to OWASP core ruleset


## Installation steps

1. Clone this repository to your Ubuntu Server (t2-medium recommended)
```
git clone https://github.com/pawnu/PythonSecurityPipeline.git
```

2. Edit the code to make it work on your AWS
   - Change to your AWS subnet [vpc_subnet_id](jenkins_home/createAwsEc2.yml#L30) 
   - Change to your AWS [security_group](jenkins_home/createAwsEc2.yml#L10) (allow inbound ssh(22), WAF(80), *Optional* web-app(10007) from your IP ONLY)
   - Create an IAM role which gives full-ec2-access and assign it to your ubuntu server

3. Run the setup script to create CICD server with Jenkins+pipeline ready to go
```
cd PythonSecurityPipeline
sudo sh setup-ubuntu.sh
```

4. Make sure your firewall allows incoming traffic to port 8080. Then, go to your jenkins server URL 
```
http://your-jenkins-server:8080/
```
5. Use the temporary credentials provided on the logs to login. Change your password!
6. Go to the python pipeline project dashboard, click on "Build Now" button to start it off. 

## Setting up a Jenkins Pipeline project manually
 
**A sample pipeline is already provided through automation**

1. Click on New Item, input name for your project and select Pipeline as the option and click OK.
2. Scroll down to Pipeline section - Definition, select "Pipeline script from SCM" from drop down menu.
3. Select Git under SCM, and input Repository URL.
4. (Optional) Create and Add your credentials for the Git repo if your repo is private, and click Save.
5. You will be brought to the Dashboard of your Pipeline project, click on "Build Now" button to start off the pipeline.


**To do list:**
- [x] Select appropriate security tools and sample python project
- [x] Set up Jenkins server using docker (Dockerfile) and pipeline as code (Jenkinsfile) to run the checks
- [x] Use ansible to create AWS ec2 test instance, configure the environment, and interact with it
- [x] Hook up the web-app with ~~nginx~~+modsecurity providing WAF, ~~DDoS protection~~, reverse proxy capabilities
- [x] Bootstrap with Jenkins API/configfile to setup and automatically create the pipeline job
- [x] Carry out authenticated DAST scan on the python web app 

## Demo

![finalgif4](https://user-images.githubusercontent.com/11514346/72058904-db298200-32c8-11ea-9a15-46c179c4a0fb.gif)

### Report

![workspace](https://user-images.githubusercontent.com/11514346/71560987-46bd5500-2a68-11ea-8f1f-63c7cf65f631.JPG)

## Authors

* **Pawan Uppadey** - [pawnu](https://github.com/pawnu)


--------

<p align="center">
  <img src="images/secDevLabs-logo.png" allign="center" height=""/>
  <!-- logo font: Agency FB Bold Condensed -->
</p>

<p align="center">
A laboratory for learning secure web development in a practical manner.
</p>

<p align="center">
<a href="https://github.com/globocom/secDevLabs/blob/master/docs/CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-Welcome-brightgreen"/></a>
<a href="https://gitter.im/secDevLabs/community"><img src="https://badges.gitter.im/secDevLabs/community.svg"/></a>
</p>

## Build your lab

By provisioning local environments via docker-compose, you will learn how the most critical web application security risks are exploited and how these vulnerable codes can be fixed to mitigate them. 👩‍💻

## How do I start?

After forking this repository, you will find multiple intended vulnerable apps based on real-life scenarios in various languages such as Golang, Python and PHP. A good start would be installing the ones you are most familiar with. You can find instructions to do this on each of the apps. 💡

Each of them has an `Attack Narrative` section that describes how an attacker would exploit the corresponding vulnerability.  Before reading any code, it may be a good idea following these steps so you can better understand the attack itself. 💉

Now it's time to shield the application up! Imagine that this is your application and you need to fix these flaws! Your mission is writing new codes that mitigate them and sending a new Pull Request to deploy a secure app! 🔐

## How secure is my new code?

After mitigating a vulnerability, you can send a Pull Request to gently ask the secDevLabs community to review your new secure codes. If you're feeling a bit lost, try having a look at [this mitigation solution](https://github.com/globocom/secDevLabs/pull/29), it might help! 🚀

## OWASP Top 10 (2017) apps:

Disclaimer: You are about to install vulnerable apps in your machine! 🔥

| Vulnerability | Language | Application |
| --- | --- | --- | 
| A1 - Injection | Golang | [CopyNPaste API](owasp-top10-2017-apps/a1/copy-n-paste) |
| A1 - Injection | NodeJS | [Mongection](owasp-top10-2017-apps/a1/mongection) |
| A1 - Injection | Python | [SSType](owasp-top10-2017-apps/a1/sstype) |
| A2 - Broken Authentication | Python | [Saidajaula Monster Fit](owasp-top10-2017-apps/a2/saidajaula-monster) |
| A2 - Broken Authentication | Golang | [Insecure go project](owasp-top10-2017-apps/a2/insecure-go-project) |
| A3 - Sensitive Data Exposure | Golang | [SnakePro](owasp-top10-2017-apps/a3/snake-pro)|
| A4 - XML External Entities (XXE) | PHP | [ViniJr Blog](owasp-top10-2017-apps/a4/vinijr-blog) |
| A5 - Broken Access Control | Golang | [Vulnerable Ecommerce API](owasp-top10-2017-apps/a5/ecommerce-api) |
| A5 - Broken Access Control | NodeJS | [Tic-Tac-Toe](owasp-top10-2017-apps/a5/tictactoe) |
| A6 - Security Misconfiguration | PHP | [Vulnerable Wordpress Misconfig](owasp-top10-2017-apps/a6/misconfig-wordpress) |
| A6 - Security Misconfiguration | NodeJS | [Stegonography](owasp-top10-2017-apps/a6/stegonography) |
| A7 - Cross-Site Scripting (XSS) | Python | [Gossip World](owasp-top10-2017-apps/a7/gossip-world) |
| A8 - Insecure Deserialization | Python | [Amarelo Designs](owasp-top10-2017-apps/a8/amarelo-designs) |
| A9 - Using Components With Known Vulnerabilities | PHP | [Cimentech](owasp-top10-2017-apps/a9/cimentech) |
| A10 - Insufficient Logging & Monitoring | Python | [GamesIrados.com](owasp-top10-2017-apps/a10/games-irados) |

## Contributing
We encourage you to contribute to SecDevLabs! Please check out the [Contributing to SecDevLabs](/docs/CONTRIBUTING.md) section for guidelines on how to proceed! 🎉

## License

This project is licensed under the BSD 3-Clause "New" or "Revised" License - read [LICENSE.md](LICENSE.md) file for details. 📖

