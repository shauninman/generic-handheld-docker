# Generic Handheld Docker

Based on the [Trimui toolchain Docker image](https://git.crowdedwood.com/trimui-toolchain/) by neonloop.

## Installation

With Docker installed and running, `make shell` builds the docker image and drops into a shell inside the container. The container's `~/workspace` is bound to `./workspace` by default.

After building the first time, unless a dependency of the image has changed, `make shell` will skip building and drop into the shell. Running `make shell` from another window while already in a running shell will attach to the already running image.

