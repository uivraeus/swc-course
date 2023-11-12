# SWC Course Bootstrap

Scripts, dev-containers and examples for bootstrapping the dev environment for a SWC course.

## Prerequisites

* Ubuntu 22.04 (or later)
* Git

## How-to

### First time (maybe)

Docker anv Visual Studio Code are required. If not already installed on the system, there are convenience scripts provided to take care of that:

```shell
./install-docker.sh
./install-code.sh
```

> ⚠️ Don't run the install script if the tool is already installed.


### Update and fresh start

Run the following script to prune old work and prepare environments for a new round:

```shell
./main.sh
```

This script will invoke all other scripts in the proper order.

> The other scripts can also be invoked individually if only a specific update-operation is required/desired.
 