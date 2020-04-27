# windows

This folder uses [vagrant](https://www.vagrantup.com/) to create VM on non-unix-like system.

### Usage

Before using command to create VM, move your repository into `./workspace/`

Dependencies:

```sh
vagrant plugin install vagrant-disksize
vagrant halt
```

Commands:

```sh
# create and setup VM
vagrant up
# ssh into VM!
vagrant ssh
```
