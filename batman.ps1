
Write-Host "Equipping SAP BTP Development CLIs..."

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Phase I: Checking for Git, Node, and NPM" -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host ""

# Check if git is installed
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git is installed." -ForegroundColor Green
    git --version
}
else {
    Write-Host "Git is not installed. Please install Git to proceed." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Check if Node.js is installed
if (Get-Command node -ErrorAction SilentlyContinue) {
    Write-Host "Node.js is installed." -ForegroundColor Green
    node --version
}
else {
    Write-Host "Node.js is not installed. Please install node.js to proceed." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Check if npm is installed
if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "npm is installed." -ForegroundColor Green
}
else {
    Write-Host "npm is not installed. Please install npm to proceed." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Phase II: Checking and possibly adding CLIs for BTP dev available via NPM..." -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host ""

if (Get-Command yo -ErrorAction SilentlyContinue) {
    Write-Host "Got Yeoman? cool" 
}
else {
    Write-Host "Adding yeoman..." -ForegroundColor Magenta
    npm i -g yeoman-generator
}

Write-Host ""

if (Get-Command ui5 -ErrorAction SilentlyContinue) {
    Write-Host "Got the UI5 CLI? cool"
}
else {
    Write-Host "Adding UI5 tooling CLI..." -ForegroundColor Magenta
    npm i -g @ui5/cli
}

Write-Host ""

if (Get-Command mbt -ErrorAction SilentlyContinue) {
    Write-Host "Got MTA tools? cool"
}
else {
    Write-Host "Adding MTA tools..." -ForegroundColor Magenta
    npm i -g mbt
}

Write-Host ""

if (Get-Command abaplint -ErrorAction SilentlyContinue) {
    Write-Host "Got abaplint? cool"
}
else {
    Write-Host "Adding abaplint..." -ForegroundColor Magenta
    npm i -g @abaplint/cli
}

Write-Host ""

if (Get-Command cds -ErrorAction SilentlyContinue) {
    Write-Host "Got cap cds? very very cool"
}
else {
    Write-Host "Adding CAP CDS CLI..." -ForegroundColor Magenta
    npm i -g @sap/cds-dk
}

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Checking status of other CLIs you should have for SAP BTP development..." -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Phase III: Checking for other CLIs and tools often needed for SAP BTP development" -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host ""

# Check if Cloud Foundry CLI is installed
$cf_installed = 0
if (Get-Command cf -ErrorAction SilentlyContinue) {
    Write-Host "Cloud Foundry CLI is installed" -ForegroundColor Green
    cf --version
    $cf_installed = 1
}
else {
    Write-Host "Cloud Foundry CLI is not installed" -ForegroundColor Red
}

Write-Host ""

# Check if the SAP BTP CLI is installed
$btpcli_installed = 0
if (Get-Command btp -ErrorAction SilentlyContinue) {
    Write-Host "SAP BTP CLI is installed." -ForegroundColor Green
    btp --version
    $btpcli_installed = 1
}
else {
    Write-Host "SAP BTP CLI is not installed." -ForegroundColor Red
}

Write-Host ""

# Check if Python is installed
$python_installed = 0
if (Get-Command py -ErrorAction SilentlyContinue) {
    Write-Host "Python is installed." -ForegroundColor Green
    py --version
    $python_installed = 1
}
else {
    Write-Host "Python is not installed." -ForegroundColor Red
}

Write-Host ""

# Check if Python is installed
$pip_installed = 0
if (Get-Command pip -ErrorAction SilentlyContinue) {
    Write-Host "PIP is installed." -ForegroundColor Green
    pip --version
    $pip_installed = 1
}
else {
    Write-Host "PIP is not installed." -ForegroundColor Red
}

Write-Host ""

# Check if java is installed
$java_installed = 0
if (Get-Command java -ErrorAction SilentlyContinue) {
    Write-Host "Java is installed." -ForegroundColor Green
    java --version
    $java_installed = 1
}
else {
    Write-Host "Java is not installed." -ForegroundColor Red
}

Write-Host ""

$sqlite_installed = 0
if (Get-Command sqlite3 -ErrorAction SilentlyContinue) {
    Write-Host "SQLite is installed." -ForegroundColor Green
    sqlite3 --version
    $sqlite_installed = 1
}
else {
    Write-Host "SQLite is not installed." -ForegroundColor Red
}

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Phase IV : Checking for SAP BTP tools used for Kyma, DevSecOps, IaaS, and containerized appsWrite-Host" -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host ""

# Check if openssl is installed
$openssl_installed = 0
if (Get-Command openssl -ErrorAction SilentlyContinue) {
    Write-Host "openssl is installed." -ForegroundColor Green
    openssl version
    $openssl_installed = 1
}
else {
    Write-Host "Openssl is not installed." -ForegroundColor Red
}

Write-Host ""

# Check if docker is installed
$docker_installed = 0
if (Get-Command docker -ErrorAction SilentlyContinue) {
    Write-Host "docker is installed." -ForegroundColor Green
    docker --version
    $docker_installed = 1
}
else {
    Write-Host "Docker is not installed." -ForegroundColor Red
}

Write-Host ""

$kubernetes_installed = 0
$oidclogin_installed = 0
if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    Write-Host "Kubernetes is installed." -ForegroundColor Green
    kubectl version
    $kubernetes_installed = 1

    # If kubectl is installed also check if kubernetes oidc login plugin is installed (prerequiste for login to Kyma clusters)
    # We directly check the version of the oidc-login plugin as it is not a standalone command
    if ($null -eq (kubectl oidc-login --version 2>&1 | Out-Null)) {
        Write-Host "Kubernetes OIDC login is installed." -ForegroundColor Green
        kubectl oidc-login --version 
        $oidclogin_installed = 1
    }
    else {
        Write-Host "Kubernetes OIDC login is not installed." -ForegroundColor Red
    }
}
else {
    Write-Host "Kubernetes is not installed." -ForegroundColor Red
}

Write-Host ""

$golang_installed = 0
if (Get-Command go -ErrorAction SilentlyContinue) {
    Write-Host "Golang is installed." -ForegroundColor Green
    go version
    $golang_installed = 1
}
else {
    Write-Host "Golang is not installed." -ForegroundColor Red
}

Write-Host ""

$terraform_installed = 0
if (Get-Command terraform -ErrorAction SilentlyContinue) {
    Write-Host "Terraform is installed." -ForegroundColor Green
    terraform version
    $terraform_installed = 1
}
else {
    Write-Host "Terraform is not installed." -ForegroundColor Red
}

Write-Host ""

$show_batman = 0
if ("$cf_installed" -eq 1 -and "$btpcli_installed" -eq 1 -and "$python_installed" -eq 1 -and "$pip_installed" -eq 1 -and "$java_installed" -eq 1 -and "$sqlite_installed" -eq 1 ) {
    $show_batman = 1
}

$show_muscle = 0
if ( "$show_batman" -eq 1 -and "$openssl_installed" -eq 1 -and "$docker_installed" -eq 1 -and "$kubernetes_installed" -eq 1 -and "$oidclogin_installed" -eq 1 -and "$golang_installed" -eq 1 -and "$terraform_installed" -eq 1 ) {
    $show_muscle = 1
}


if ("$show_batman" -eq 1 ) {
    Write-Host "       _,    _   _    ,_" -ForegroundColor Yellow
    Write-Host "  .o888P     Y8o8Y     Y888o." -ForegroundColor Yellow
    Write-Host " d88888      88888      88888b" -ForegroundColor Yellow
    Write-Host "d888888b_  _d88888b_  _d888888b" -ForegroundColor Yellow
    Write-Host "8888888888888888888888888888888" -ForegroundColor Yellow
    Write-Host "8888888888888888888888888888888" -ForegroundColor Yellow
    Write-Host "YJGS8P~Y888P~Y888P~Y888P~Y8888P" -ForegroundColor Yellow
    Write-Host " Y888   '8'   Y8P   '8'   888Y" -ForegroundColor Yellow
    Write-Host "  '8o          V          o8'" -ForegroundColor Yellow
    Write-Host "    `                     ` " -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    Write-Host "Congratulations! You are now like Batman in SAP BTP development!" -ForegroundColor Yellow
    Write-Host "****************************************************" -ForegroundColor Yellow
    Write-Host ""
}

if ( "$show_muscle" -eq 1 ) {
    Write-Host "And you installed all the other Phase IV CLIs for Kubernetes, Kyma, DevSecOps, containerized apps and IaaS? You really went the extra mile. I'm impressed!" -ForegroundColor Cyan
    Write-Host "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
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
    ⠀⠛⠛⠋⠁⠐⠛⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host "Phase V: Bonus round!" -ForegroundColor Blue
Write-Host "****************************************************" -ForegroundColor Blue
Write-Host ""
    
$gcloud_exists = 0
if (Get-Command gcloud -ErrorAction SilentlyContinue) {
    $gcloud_exists = 1
    Write-Host "You got Google Cloud CLI? Nice!"
}
else {
    Write-Host "Try the Google Cloud CLI sometime :)"
}

Write-Host "~"

$aws_exists = 0
if (Get-Command aws -ErrorAction SilentlyContinue) {
    $aws_exists = 1
    Write-Host "You got AWS CLI? Nice!"
}
else {
    Write-Host "Try the AWS CLI sometime :)"
}

Write-Host "~"

$azure_exists = 0
if (Get-Command az -ErrorAction SilentlyContinue) {
    $azure_exists = 1
    Write-Host "You got Azure CLI? Nice!"
}
else {
    Write-Host "Try the Azure CLI sometime :)"
}

Write-Host "~"

$ibmcloud_exists = 0
if (Get-Command ibmcloud -ErrorAction SilentlyContinue) {
    $ibmcloud_exists = 1
    Write-Host "You got IBM Cloud CLI? Nice!"
}
else {
    Write-Host "Try the IBM Cloud CLI sometime :)"
}

Write-Host "~"

$openshift_exists = 0
if (Get-Command oc -ErrorAction SilentlyContinue) {
    $openshift_exists = 1
    Write-Host "You got Openshift? You are true cloud pro!"
}
else {
    Write-Host "Try the Red Hat Open Shift CLI sometime for cnative apps :)"
}

Write-Host "~"

$nats_exists = 0
if (Get-Command nats -ErrorAction SilentlyContinue) {
    $nats_exists = 1
}
else {
    Write-Host "Try the NATs CLI sometime for edge compute :)"
}

Write-Host "~"

$geth_exists = 0
if (Get-Command geth -ErrorAction SilentlyContinue) {
    $geth_exists = 1
    Write-Host "Whoah! you got geth? You can connect to EVM blockchains natively? cool!"
}
else {
    Write-Host "Try the Geth CLI sometime for Ethereum smart contracts/blockchain :)"
}

Write-Host "~"

$llama_exists = 0
if (Get-Command ollama -ErrorAction SilentlyContinue) {
    $llama_exists = 1
    Write-Host "Mark would to thank you for trying Llama!"
}
else {
    Write-Host "Try the Lllama CLI sometime for AI :)"
}

Write-Host "~"

$rustup_exists = 0
if (Get-Command rustup -ErrorAction SilentlyContinue) {
    $rustup_exists = 1
    Write-Host "aha. you like rust too?"
}
else {
    Write-Host "Try building in Rust someday :)"
}

Write-Host "~"

$cargo_exists = 0
if (Get-Command cargo -ErrorAction SilentlyContinue) {
    $cargo_exists = 1
    Write-Host "Glad you got cargo too. Rust is good! I'd build SAP T/5 HANA with it - but thats just my opinion"
}
else {
    Write-Host "Let me remind you again : Try building in Rust someday :)"
}

Write-Host "~"

$show_gigachad = 0
if ( "$gcloud_exists" -eq 1 -and "$aws_exists" -eq 1 -and "$azure_exists" -eq 1 -and "$ibmcloud_exists" -eq 1 -and "$openshift_exists" -eq 1 -and "$nats_exists" -eq 1 -and "$geth_exists" -eq 1 -and "$llama_exists" -eq 1 -and "$rustup_exists" -eq 1 -and "$cargo_exists" -eq 1 ) {
    $show_gigachad = 1
}
    
Write-Host ""

if ( "$show_gigachad" -eq 1 ) {
    Write-Host "AND YOU GOT ##ALL## THE SECRET ONES TOO?!? You are a ..."
    Write-Host ""
    Write-Host "~ c e r t i f i e d ~"
    Write-Host "
    
██████╗ ██╗ ██████╗  █████╗  ██████╗██╗  ██╗ █████╗ ██████╗ 
██╔════╝ ██║██╔════╝ ██╔══██╗██╔════╝██║  ██║██╔══██╗██╔══██╗
██║  ███╗██║██║  ███╗███████║██║     ███████║███████║██║  ██║
██║   ██║██║██║   ██║██╔══██║██║     ██╔══██║██╔══██║██║  ██║
╚██████╔╝██║╚██████╔╝██║  ██║╚██████╗██║  ██║██║  ██║██████╔╝
╚═════╝ ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    "
    Write-Host ""
}
    

    

else {
    Write-Host " You're almost there! There's just a few things you should check" -ForegroundColor Magenta
    Write-Host "████████ ██████  ██    ██      █████   ██████   █████  ██ ███    ██  " -ForegroundColor Magenta
    Write-Host "   ██    ██   ██  ██  ██      ██   ██ ██       ██   ██ ██ ████   ██  " -ForegroundColor Magenta
    Write-Host "   ██    ██████    ████       ███████ ██   ███ ███████ ██ ██ ██  ██  " -ForegroundColor Magenta
    Write-Host "   ██    ██   ██    ██        ██   ██ ██    ██ ██   ██ ██ ██  ██ ██  " -ForegroundColor Magenta
    Write-Host "   ██    ██   ██    ██        ██   ██  ██████  ██   ██ ██ ██   ████  " -ForegroundColor Magenta
    Write-Host ""
    Write-Host "Look up how to install:" -ForegroundColor Magenta

    if ( "$cf_installed" -eq 0 ) {
        Write-Host "Install the cloud foundry CLI"
    }

    if ( "$btpcli_installed" -eq 0 ) {
        Write-Host "Install the SAP BTP CLI"
    }

    if ( "$python_installed" -eq 0 ) {
        Write-Host "Install Python"
    }

    if ( "$pip_installed" -eq 0 ) {
        Write-Host "Install Pip"
    }

    if ( "$java_installed" -eq 0 ) {
        Write-Host "Install Java"
    }

    if ( "$openssl_installed" -eq 0 ) {
        Write-Host "Install openssl"
    }

    if ( "$docker_installed" -eq 0 ) {
        Write-Host "Install docker" 
    }

    if ( "$kubernetes_installed" -eq 0 ) {
        Write-Host "Install Kubernetes"
    }

    if ("$oidclogin_installed" -eq 0 ) {
        Write-Host "Install Kubernetes OIDC Plugin"
    } 

    if ( "$golang_installed" -eq 0 ) {
        Write-Host "Install Golang"
    }
}
