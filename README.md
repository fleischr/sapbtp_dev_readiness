# The "Batman Test" for SAP BTP Development CLI, SDKs, and other Automation Tools

### How to use
Clone/download this repo. Open bash command line and run

```./batman```

If you get the bat signal - you have all the tools I consider to be necessary to be a productive SAP BTP developer / adminstrator. A good follow up once you have them installed is to read ""

### Command line tools checked for (and why they're included!)

I've ranked the tools into phases. Phases I-III: Basic. Phase IV: Intermediate. Phase V: Advanced.

To acquire the bat-signal, you will need to have these CLIs and other tools ready from phases I-III

Phase IV tests your readiness for a few more advanced tools used in more sophisticated SAP BTP environments that are less commonly used today - but are good to add to your knowledge. If you get everything up through Phase IV - you get a flexing blue bicep honoring your commitment learning and innovation!


#### Phase I 

Basic readiness: Git and Node.js/NPM. These are essential to get a very simple SAP BTP app up and running.

<b>Git</b></br>
Use git to version control your BTP app code.
</br>

<b>Node.js</b></br>
JavaScript and TypeScript - but it's a server!
</br>

<b>NPM</b></br>
The Node.js Package Manager. This manages installation of 3rd party modules from NPMJS registry
</br>

#### Phase II

Adds CLI tools globally via NPM. These add some commonly used tooling for building apps for SAP BTP on your local machine. Starting to use these tools makes you a faster, more productive developer.

<b>Yeoman</b></br>
Yeoman is hand for automated creation of Fiori and SAP BTP apps
</br>

<b>UI5 CLI</b></br> 
</br>

<b>MTA tools MBT </b></br>
</br>

<b>abaplint</b></br>
If you know you know! abaplint is a tool for evaluating code quality of abapGit repositories.
</br>

<b>CAP CDS</b></br>
Sure you could learn to build CAP by clicking buttons in Business App Studio or SAP Build Code. But you'd be missing a lot! The CDS command line can help you build a cloud native app or integration for SAP extremely quickly
</br>


#### Phase III

At the completion of Phase III - you earn the bat signal! 

Phase III evaluates your basic capability to deploy / adminster apps and work across multiple types of environments. These tools take a bit more effort to manage and use the first time - but are still simple. On Windows - you may be editing some system environment or path variables or running elevated command prompts to bring all these tools online. 

<b>Cloud Foundry Tools</b></br>
The Cloud Foundry CLI is used by BTP developers and admins to deploy apps and monitor the Cloud Foundry environments
</br>

<b>SAP BTP CLI</b></br>
The SAP BTP CLI is used for general subaccount administration. Why use the CLI instead of the GUI? Apart from it being faster to navigate through - you can write bash scripts around the CLI to automate tasks in BTP subaccount administration.
</br>

<b>Python</b></br>
Python is very commonly used for AI applications among also a broad range of other use cases 
</br>

<b>PIP</b></br>
PIP is the package manager for Python. It can sometimes be easily missed during Python installation.
</br>

<b>Java</b></br>
Java is used for some SAP applications. Many SAP developers otherwise tend to need to install Java in order to use Eclipe and ABAP Developer Tools. All the more important as for ABAP Steampunk Eclipse ADT is the only officially supported IDE (no SE80!).

Keep in mind - there are multiple open source providers of Java installation. If you have any Oracle licensing issues - consider Amazon Corretto or OpenJDK.

I have more details on that in my Eclipe Install guide.
</br>

<b>SQLite</b></br>
SQLite is commonly used as a database for all kinds of apps. In SAP BTP - it may be used for hosting sap CAP dbs in development. (Fun fact: SQLite is actually the most widely deployed database in the world!)
</br>

#### Phase IV

Phase IV checks for other advanced tools for cloud native development, Kyma/Kubernetes, infrastructure, and DevSecOps on SAP BTP.
<i>Maybe</i> out of scope for some very basic SAP BTP implementations - but important building apps and integrations with high transaction volume and resilient infrastructure. Even if you don't use quite all of it right away - its good to have awareness of.

<b>Golang</b></br>
Golang as programming language is quietly becoming just a frequently used as Java, JavaScript, and Python in SAP's BTP code samples. Why? Because Golang is at the forefront of cloud native apps beyond the SAP world. Golang is also frequently used for scripting CI/CD with Jenkins.

<b>Docker</b></br>
Docker "containerizes" apps, their runtimes, and resources. This is very useful for developing and testing across multiple technology stack profiles. Used correctly - it can also eliminate a lot of headaches trying to handcraft the many system environments and configurations you may have to account and juggle in cloud landscapes.
</br>

<b>OpenSSL</b></br>
Cryptography is a must for multi-party integrations. OpenSSL tools are used to produce private keys, encryption, and digital signatures that make data and integrations more trusted.
</br>

<b>Kubernetes</b></br>
Kubernetes (often abbreviated as K8s) is an open-source platform for automating the deployment, scaling, and management of containerized applications. It handles container orchestration across a cluster, ensuring high availability, scalability, and self-healing capabilities for resilient application operations. Developed by Google, Kubernetes simplifies complex container operations, making it a key tool for cloud-native applications.

On SAP BTP - the Kyma project presents a set of standard tooling for K8s on SAP BTP. I recommend considering it for high volume, mission-and-time critical apps for manufacturing, supply chain, and B2C.
</br>

<b>Terraform</b></br>
Terraform is Infrastructure as Code (IaC). This allows you save and version your infrastructure configuration in a machine-readable format rather than a long word doc of screenshots and instructions. This can greatly acclerate your BTP rollout! I recommend checking out the <a href="https://github.com/SAP/terraform-provider-btp">Terraform Provider for SAP BTP</a> and the <a href="https://github.com/SAP-samples/btp-genai-starter-kit">Generative AI starter kit</a> as highlight examples.

#### Phase V Easter eggs!

There are many other really remarkable tools and platforms you can bring alongside SAP BTP. I hardly have to time to mention them all, but it's an idea worth bringing up while you're exploring.

You will likely find digging into specific offerings of hyperscalers (AWS, Azure, Google Cloud, etc..) very worthwhile for custom development and integrations. It really opens a lot more horizons than what we commonly to know to be part of BTP. Though I think you get more mileage from that kind of exploration having first looked in to Phase IV.

The innovation doesn't end there though! I've curated some checks for other tools in AI, edge-compute, cloud-native app architecture, other programming languages, and blockchain that I think are compelling for SAP BTP experts to experiment with. Install them all to earn a "certified gigachad" recognition!

### Contributing

If there's command line tools you think I overlooked for SAP BTP developers - feel free to open an issue or pull request to add them.


