# deepin-openqa-task-trigger
**Description**: openQa-task-trigger is used to trigger jobs running on the openQA server https://openqa.deepin.io which build with Docker container.
**Thanks**:
Thanks to [os-autoinst](https://github.com/os-autoinst) group for providing such a good automated testing framework.

## Dependencies
docker 1.8+ ([Docker Installation](http://docs.docker.com/engine/installation/))  
docker image: deepin/openqa-base ([openQA-base](https://github.com/choldrim/deepin-openqa-base-runner))  
local or remote openQA server ([openQA-webui](https://github.com/choldrim/deepin-openqa-webui))


## Installation
#### 0. environment preparation
(1) prepare an on-service state openQA webui server
reference  [openQA-webui](https://github.com/choldrim/deepin-openqa-webui)

(2) prepare the `/data` dir for the default workspace  
```shell
sudo mkdir -p /data
sudo chmod 777 /data
```

#### 1. clone the code
```shell
git clone --recursive https://github.com/choldrim/deepin-openqa-task-trigger
```

#### 2. prepare the worker container
```shell
cd deepin-openqa-task-trigger
make build
```

#### 3. cp the tools to your PATH
```shell
sudo make install
```

#### 4. update the configure for your environment
There is a file needed to be checked before trig an openQA task
```shell
/data/docker/openqa-worker/etc_openqa/client.conf
```
If your openQA server IP is `172.17.42.1`,  
keep the `client.conf` file containing:
```ini
[172.17.42.1]
key = 1234567890ABCDEG
secret = 1234567890ABCDEG
```

## Usage
```shell
# use --help show the usage
openqa-trigger --help
usage: openqa-test [-h] [--fetch-iso] [--fetch-testcase] [--latest-build]
                   [--host HOST]
                   [FOO=BAR [FOO=BAR ...]]

openqa testes trigger tool

positional arguments:
  FOO=BAR           env vars of the running environment

optional arguments:
  -h, --help        show this help message and exit
  --fetch-iso       auto download the ISO, which match the BUILD num
  --fetch-testcase  auto fetch latest testcase
  --latest-build    auto fetch the latest build date of deepin ISO, and store
                    as BUILD env
  --host HOST       openqa server host
```

## Example
#### start a normal test
```shell
openqa-trigger --host 172.17.42.1 --fetch-testcase --latest-build --fetch-iso
# this command will trigger the openQA server running on 172.17.42.1 to start new job(s) with latest iso and latest testcase.
```

## Uninstall
If you don't use it any more, just run `docker rm -f deepin/openqa-trigger` to remove it.

### Relative
[openQA](https://github.com/os-autoinst/openQA)  
[os-autoinst](https://github.com/os-autoinst/os-autoinst)  
[deepin-openqa-base-runner](https://github.com/choldrim/deepin-openqa-base-runner)  
[deepin-openqa-webui](https://github.com/choldrim/deepin-openqa-webui)  
[deepin-openqa-worker](https://github.com/choldrim/deepin-openqa-worker)  
[deepin-openqa-task-trigger](https://github.com/choldrim/deepin-openqa-task-trigger)  
