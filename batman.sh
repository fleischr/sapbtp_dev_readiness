echo "Equipping SAP BTP Development CLIs..."

# Function to check if a command exists
command_exists () {
    command -v "$1" >/dev/null 2>&1
}

pipechar="|"

# Text colors
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
RESET="\033[0m"

# Text attributes
BOLD="\033[1m"
UNDERLINE="\033[4m"

echo -e "${BOLD} Phase I: Checking for Git, Node, and NPM ${RESET}"
echo ""

# Check if git is installed
if command_exists git; then
    echo -e "${GREEN}Git is installed.${RESET}"
    git --version
else
    echo -e "${RED}Git is not installed. Please install Git to proceed.${RESET}"
    exit 1
fi
echo ""

# Check if Node.js is installed
if command_exists node; then
    echo -e "${GREEN}Node.js is installed.${RESET}"
    node --version
else
    echo -e "${RED}Node.js is not installed. Please install node.js to proceed.${RESET}"
    exit 1
fi
echo ""

# Check if npm is installed
if command_exists npm; then
    echo -e "${GREEN}npm is installed.${RESET}"
else
    echo -e "${RED}npm is not installed. Please install npm to proceed.${RESET}"
    exit 1
fi
echo ""



echo -e "${BOLD} Phase II: Checking and possibly adding CLIs for BTP dev available via NPM...${RESET}"
echo ""

if command_exists yo; then
    echo "Got Yeoman? cool"
else
    echo -e "${MAGENTA}Adding yeoman...${RESET}"
    npm i -g yeoman-generator
fi
echo ""

if command_exists ui5; then
    echo "Got the UI5 CLI? cool"
else
    echo -e "${MAGENTA}Adding UI5 tooling CLI...${RESET}"
    npm i -g @ui5/cli
fi
echo ""

if command_exists mbt; then
    echo "Got MTA tools? cool"
else
    echo -e "${MAGENTA}Adding MTA tools...${RESET}"
    npm i -g mbt
fi
echo ""

if command_exists abaplint; then
    echo "Got abaplint? cool"
else
    echo -e "${MAGENTA}Adding abaplint...${RESET}"
    npm i -g @abaplint/cli
fi
echo ""

if command_exists cds; then
    echo "Got cap cds? very very cool"
else
    echo -e "${MAGENTA}Adding CAP CDS CLI...${RESET}"
    npm i -g @sap/cds-dk
fi
echo ""

echo -e "${BOLD}Checking status of other CLIs you should have for SAP BTP development...${RESET}"
echo ""

show_batman=0

echo -e "${BOLD}Phase III: Checking for other CLIs and tools often needed for SAP BTP development"

# Check if Cloud Foundry CLI is installed
cf_installed=0
if command_exists cf; then
    echo -e "${GREEN}Cloud Foundry CLI is installed${RESET}"
    cf --version
    cf_installed=1
else
    echo -e "${RED}Cloud Foundry CLI is not installed${RESET}"
fi
echo ""

# Check if the SAP BTP CLI is installed
btpcli_installed=0
if command_exists btp; then
    echo -e "${GREEN}SAP BTP CLI is installed.${RESET}"
    btp --version
    btpcli_installed=1
else
    echo -e "${RED}SAP BTP CLI is not installed.${RESET}"
fi
echo ""

# Check if Python is installed
python_installed=0
if command_exists py; then
    echo -e "${GREEN}Python is installed.${RESET}"
    py --version
    python_installed=1
elif command_exists python3; then
    echo -e "${GREEN}Python is installed.${RESET}"
    python3 --version
    python_installed=1
else
    echo -e "${RED}Python is not installed.${RESET}"
fi
echo ""

# Check if Python is installed
pip_installed=0
if command_exists pip; then
    echo -e "${GREEN}PIP is installed.${RESET}"
    pip --version
    pip_installed=1
else
    echo -e "${RED}PIP is not installed.${RESET}"
fi
echo ""

# Check if java is installed
java_installed=0
if command_exists java; then
    echo -e "${GREEN}Java is installed.${RESET}"
    java --version
    java_installed=1
else
    echo -e "${RED}Java is not installed.${RESET}"
fi
echo ""

sqlite_installed=0
if command_exists sqlite3; then
    echo -e "${GREEN}SQLite is installed.${RESET}"
    sqlite3 --version
    sqlite_installed=1
else
    echo -e "${RED}SQLite is not installed.${RESET}"
fi

echo -e "${BOLD} Phase IV : Checking for SAP BTP tools used for Kyma, DevSecOps, IaaS, and containerized apps ${RESET}"

# Check if openssl is installed
openssl_installed=0
if command_exists openssl; then
    echo -e "${GREEN}openssl is installed.${RESET}"
    openssl version
    openssl_installed=1
else
    echo -e "${RED}Openssl is not installed.${RESET}"
fi
echo ""

# Check if docker is installed
docker_installed=0
if command_exists docker; then
    echo -e "${GREEN}docker is installed.${RESET}"
    docker --version
    docker_installed=1
else
    echo -e "${RED}Docker is not installed.${RESET}"
fi
echo ""

kubernetes_installed=0
oidclogin_installed=0
if command_exists kubectl; then
    echo -e "${GREEN}Kubernetes is installed.${RESET}"
    kubectl version
    kubernetes_installed=1

# If kubectl is installed also check if kubernetes oidc login plugin is installed (prerequiste for login to Kyma clusters)
# We directly check the version of the oidc-login plugin as it is not a standalone command
    if kubectl oidc-login --version >/dev/null 2>&1 ; then
        echo -e "${GREEN}Kubernetes OIDC login is installed.${RESET}"
        kubectl oidc-login --version
        oidclogin_installed=1
    else
        echo -e "${RED}Kubernetes OIDC login is not installed.${RESET}"
    fi
else
    echo -e "${RED}Kubernetes is not installed.${RESET}"
fi
echo ""

golang_installed=0
if command_exists go; then
    echo -e "${GREEN}Golang is installed.${RESET}"
    go version
    golang_installed=1
else
    echo -e "${RED}Golang is not installed.${RESET}"
fi
echo ""

terraform_installed=0
if command_exists terraform; then
    echo -e "${GREEN}Terraform is installed.${RESET}"
    terraform version
    terraform_installed=1
else
    echo -e "${RED}Terraform is not installed.${RESET}"
fi
echo ""

if ([ "$cf_installed" -eq 1 ] && [ "$btpcli_installed" -eq 1 ] && [ "$python_installed" -eq 1 ] && [ "$pip_installed" -eq 1 ] && [ "$java_installed" -eq 1 ] && [ "$sqlite_installed" -eq 1 ]); then
    show_batman=1
else
    show_batman=0
fi

show_muscle=0
if ([ "$show_batman" -eq 1 ] && [ "$openssl_installed" -eq 1 ] && [ "$docker_installed" -eq 1 ] && [ "$kubernetes_installed" -eq 1 ] && [ "$oidclogin_installed" -eq 1 ] && [ "$golang_installed" -eq 1 ] && [ "$terraform_installed"  -eq 1 ] ); then
    show_muscle=1
fi

if [ "$show_batman" -eq 1 ]; then
    echo -e "${YELLOW}       _,    _   _    ,_${RESET}"
    echo -e "${YELLOW}  .o888P     Y8o8Y     Y888o.${RESET}"
    echo -e "${YELLOW} d88888      88888      88888b${RESET}"
    echo -e "${YELLOW}d888888b_  _d88888b_  _d888888b${RESET}"
    echo -e "${YELLOW}8888888888888888888888888888888${RESET}"
    echo -e "${YELLOW}8888888888888888888888888888888${RESET}"
    echo -e "${YELLOW}YJGS8P~Y888P~Y888P~Y888P~Y8888P${RESET}"
    echo -e "${YELLOW} Y888   '8'   Y8P   '8'   888Y${RESET}"
    echo -e "${YELLOW}  '8o          V          o8'${RESET}"
    echo -e "${YELLOW}    `                     `${RESET}"
    echo -e "${BOLD} Congratulations! You are now like Batman in SAP BTP development!${RESET}"
    echo ""

    if [ "$show_muscle" -eq 1 ]; then
    echo -e "${CYAN} And you installed all the other Phase IV CLIs for Kubernetes, Kyma, DevSecOps, containerized apps and IaaS? You really went the extra mile. I'm impressed!${RESET}"
    echo -e "\e[36m⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⠿⡏⢿⡟⠿⠁⢸⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣁⣀⡀⢠⣶⠶⠀⠁⣽⣿⣆⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠘⣿⣿⣷⡀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣆⠀⠀⠀⠀
    ⠀⠀⢀⣠⣴⣶⣶⣶⣦⣄⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⣼⣿⣿⣿⣿⣧⠀⠀⠀
    ⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣐⢾⣿⣿⣿⣿⣷⣦⣌⡻⣿⣿⣿⣿⣿⣧⠀⠀
    ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⡇⠀
    ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢋⡉⠛⠿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⡇⠀
    ⠀⣿⣿⣿⣿⣿⣿⣿⣿⡏⢠⣿⣿⣷⡦⠀⣈⣉⣀⣤⣶⣿⣟⣛⠛⠛⠛⠛⠃⠀
    ⠀⣿⣿⣿⣿⣿⣿⣿⡿⠀⠾⠛⠋⠁⠐⠺⠿⠿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀
    ⠀⣿⣿⣿⣿⣿⣿⠟⢁⣴⣶⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⣿⣿⣿⣿⠿⠋⣰⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠛⠛⠋⠁⠐⠛⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\e[0m"
    echo ""

    echo -e "${BOLD} Phase V: Bonus round! ${RESET}"

    gcloud_exists=0
    if command_exists gcloud; then
        gcloud_exists=1
        echo -e "You got Google Cloud CLI? Nice!"
    else
        echo -e "Try the Google Cloud CLI sometime :)"
    fi
    echo "~"

    aws_exists=0
    if command_exists aws; then
        aws_exists=1
        echo -e "You got AWS CLI? Nice!"
    else
        echo -e "Try the AWS CLI sometime :)"
    fi
    echo "~"

    azure_exists=0
    if command_exists az; then
        azure_exists=1
        echo -e "You got Azure CLI? Nice!"
    else
        echo -e "Try the Azure CLI sometime :)"
    fi
    echo "~"

    ibmcloud_exists=0
    if command_exists ibmcloud; then
        ibmcloud_exists=1
        echo -e "You got IBM Cloud CLI? Nice!"
    else
        echo -e "Try the IBM Cloud CLI sometime :)"
    fi
    echo "~"

    openshift_exists=0
    if command_exists oc; then
        openshift_exists=1
        echo -e "You got Openshift? You are true cloud pro!"
    else
        echo -e "Try the Red Hat Open Shift CLI sometime for cnative apps :)"
    fi
    echo "~"

    nats_exists=0
    if command_exists nats; then
        nats_exists=1
    else
        echo -e "Try the NATs CLI sometime for edge compute :)"
    fi
    echo "~"

    geth_exists=0
    if command_exists geth; then
        hardhat_exists=1
        echo -e "Whoah! you got geth? You can connect to EVM blockchains natively? cool!"
    else
        echo -e "Try the Geth CLI sometime for Ethereum smart contracts/blockchain :)"
    fi
    echo "~"

    llama_exists=0
    if command_exists ollama; then
        llama_exists=1
        echo -e "Mark would to thank you for trying Llama!"
    else
        echo -e "Try the Lllama CLI sometime for AI :)"
    fi
    echo "~"

    rustup_exists=0
    if command_exists rustup; then
        rustup_exists=1
        echo -e "aha. you like rust too?"
    else
        echo -e "Try building in Rust someday :)"
    fi
    echo "~"

    cargo_exists=0
    if command_exists cargo; then
        cargo_exists=1
        echo -e "Glad you got cargo too. Rust is good! I'd build SAP T/5 HANA with it - but thats just my opinion"
    else
        echo -e "Let me remind you again : Try building in Rust someday :)"
    fi
    echo "~"

    show_gigachad=0
    if ( [ "$gcloud_exists" -eq 1 ] && [ "$aws_exists" -eq 1 ] && [ "$azure_exists" -eq 1 ] && [ "$ibmcloud_exists" -eq 1 ] && [ "$openshift_exists" -eq 1 ] && [ "$nats_exists" -eq 1 ] && [ "$hardhat_exists"  -eq 1 ] && [ "$llama_exists" -eq 1 ] && [ "$rustup" -eq 1 ] && [ "$cargo_exists" -eq 1] ); then
        show_gigachad=1
    fi
    echo ""

    if [ "$show_gigachad" -eq 1 ]; then
    echo "AND YOU GOT ##ALL## THE SECRET ONES TOO?!? You are a ..."
    echo ""
    echo "~ c e r t i f i e d ~"
    echo "
    
██████╗ ██╗ ██████╗  █████╗  ██████╗██╗  ██╗ █████╗ ██████╗ 
██╔════╝ ██║██╔════╝ ██╔══██╗██╔════╝██║  ██║██╔══██╗██╔══██╗
██║  ███╗██║██║  ███╗███████║██║     ███████║███████║██║  ██║
██║   ██║██║██║   ██║██╔══██║██║     ██╔══██║██╔══██║██║  ██║
╚██████╔╝██║╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║██████╔╝
╚═════╝ ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    "
    echo ""
    fi

    fi

else
    echo -e "${MAGENTA} You're almost there! There's just a few things you should check${RESET}"
    echo -e "${MAGENTA}████████ ██████  ██    ██      █████   ██████   █████  ██ ███    ██   ${RESET}"
    echo -e "${MAGENTA}   ██    ██   ██  ██  ██      ██   ██ ██       ██   ██ ██ ████   ██   ${RESET}"
    echo -e "${MAGENTA}   ██    ██████    ████       ███████ ██   ███ ███████ ██ ██ ██  ██   ${RESET}"
    echo -e "${MAGENTA}   ██    ██   ██    ██        ██   ██ ██    ██ ██   ██ ██ ██  ██ ██   ${RESET}"
    echo -e "${MAGENTA}   ██    ██   ██    ██        ██   ██  ██████  ██   ██ ██ ██   ████   ${RESET}"
    echo ""
    echo -e "${MAGENTA}Look up how to install: ${RESET}"

    if [ "$cf_installed" -eq 0 ]; then
        echo "Install the cloud foundry CLI"
    fi

    if [ "$btpcli_installed" -eq 0 ]; then
        echo "Install the SAP BTP CLI"
    fi

    if [ "$python_installed" -eq 0 ]; then
        echo "Install Python"
    fi

    if [ "$pip_installed" -eq 0 ]; then
        echo "Install Pip"
    fi

    if [ "$java_installed" -eq 0 ]; then
        echo "Install Java"
    fi

    if [ "$openssl_installed" -eq 0 ]; then
        echo "Install openssl"
    fi

    if [ "$docker_installed" -eq 0 ]; then
        echo "Install docker" 
    fi

    if [ "$kubernetes_installed" -eq 0 ]; then
        echo "Install Kubernetes"
    fi

    if [ "$oidclogin_installed" -eq 0 ]; then
        echo "Install Kubernetes OIDC Plugin"
    fi

    if [ "$golang_installed" -eq 0 ]; then
        echo "Install Golang"
    fi
fi
