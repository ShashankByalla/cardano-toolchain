# cardano-toolchain
# Cardano Toolchain in Docker

This repository provides a Docker-based toolchain to build and run the Cardano node (`cardano-node`) and CLI (`cardano-cli`) in a containerized environment. The Dockerfile simplifies the process of compiling and setting up the binaries without requiring a manual environment setup on your local machine.

## Table of Contents
- [Cardano Toolchain in Docker](#cardano-toolchain-in-docker)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Building the Docker Image](#building-the-docker-image)
  - [Running the Container](#running-the-container)
  - [Usage](#usage)
    - [cardano-node](#cardano-node)
    - [cardano-cli](#cardano-cli)
  - [Exposing Ports](#exposing-ports)
  - [Cleaning Up](#cleaning-up)
  - [Contributing](#contributing)
  - [License](#license)

---

## Prerequisites

Ensure that the following software is installed on your system:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Git** (optional): [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

You can check if Docker is installed by running:
```bash
docker --version
```

## Building the Docker Image

1. Clone this repository (or download the `Dockerfile` and supporting files):

   ```bash
   git clone https://github.com/yourusername/cardano-toolchain.git
   cd cardano-toolchain
   ```

2. Build the Docker image:

   ```bash
   docker build -t cardano-toolchain .
   ```

This command will create a Docker image with the Cardano toolchain (including `cardano-node` and `cardano-cli`) installed.

## Running the Container

Once the image is built, you can start the container:

```bash
docker run -it cardano-toolchain
```

This will start a shell session within the container where you can run the Cardano node and CLI commands.

## Usage

### cardano-node

To check the `cardano-node` version and ensure it’s properly installed, run:

```bash
cardano-node --version
```

You should see output displaying the version of `cardano-node` that was compiled.

### cardano-cli

Similarly, you can verify `cardano-cli` by running:

```bash
cardano-cli --version
```

Both binaries are compiled and ready to use within the container.

## Exposing Ports

If you need to expose ports for communication with other nodes or services, you can do so by using Docker’s `-p` flag.

For example, to expose the default Cardano node communication ports (3000 and 6000), run:

```bash
docker run -it -p 3000:3000 -p 6000:6000 cardano-toolchain
```

This will map the container's ports 3000 and 6000 to your local machine, allowing external services to communicate with the Cardano node.

## Cleaning Up

When you are done, you can stop and remove the running container:

1. Find the container ID by listing running containers:

   ```bash
   docker ps
   ```

2. Stop the container:

   ```bash
   docker stop <container-id>
   ```

3. (Optional) Remove the stopped container:

   ```bash
   docker rm <container-id>
   ```

4. (Optional) To remove the image:

   ```bash
   docker rmi cardano-toolchain
   ```

## Contributing

Feel free to fork this repository, submit issues, or open pull requests. Contributions that improve the build process, documentation, or functionality are always welcome!

1. Fork the repository
2. Create a new branch: `git checkout -b my-feature-branch`
3. Commit your changes: `git commit -m 'Add new feature'`
4. Push the branch: `git push origin my-feature-branch`
5. Open a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
