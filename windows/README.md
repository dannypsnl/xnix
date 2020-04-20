# windows

This folder uses [vagrant](https://www.vagrantup.com/) to create VM on non-unix-like system.

### Usage

Before using command to create VM, remember mount target repository:

```ruby
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "<repo-host-path>", "<repo-vm-path>"
```

uncomment final line and put specific information into it.

Commands:

```sh
# create and setup VM
vagrant up
# ssh into VM!
vagrant ssh
```
