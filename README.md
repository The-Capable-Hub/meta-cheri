# meta-cheri

CHERI Architecture Layer for CHERI enabled processors

## Building from source

One can use [kas](https://kas.readthedocs.io/en/latest/) tool for building. To install either do

```shell
pipx install kas
```

or install it via your normal distribution's way, e.g.

```shell
sudo apt install kas
```

Please note that kas at version 5.2 is required, to check version see

```shell
kas --version
```

### Building on the host

Building with `kas` is then as easy as:

```shell
kas build ./kas/qemu-riscv64-codasip-distro-multilib.yml
```

### Building in a container

One can also use `kas-container` to tick off all of the host dependencies
required for `Yocto`. If you have environment variables `DL_DIR`, `SSTATE_DIR`
set, these will automatically mounted and used in the container.

If you need ssh configuration and credentials for the build, you can pass them
using `--ssh-dir` and `--ssh-agent` (or using environment variables
`KAS_SSH_DIR` and `KAS_SSH_AUTH_SOCK`):

```shell
kas-container build kas/qemu-riscv64-codasip-distro-multilib.yml
```

## Running with qemu

```shell
kas shell kas/qemu-riscv64-codasip-distro-multilib.yml -c 'runqemu qemuriscv64cheri nographic slirp snapshot'
```

or for `kas-container`:

```shell
kas-container shell kas/qemu-riscv64-codasip-distro-multilib.yml -c 'runqemu qemuriscv64cheri nographic slirp snapshot'
```
