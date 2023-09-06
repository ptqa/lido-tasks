# Ansible Stack Installation for Grafana, Prometheus, AlertManager, Loki, Node-Exporter, and Cadvisor

This Ansible project automates the installation and configuration of a monitoring stack consisting of Grafana, Prometheus, AlertManager, Loki, Node-Exporter, and Cadvisor. It also includes testing using Molecule and Vagrant to ensure the stack's integrity.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

1. **Ansible**: Ensure Ansible is installed on your local machine. You can install Ansible following the [official documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

2. **Vagrant**: Vagrant is used to manage virtual machines for testing purposes. Install Vagrant by following the [official documentation](https://www.vagrantup.com/docs/installation).

3. **VirtualBox (or another supported provider)**: Vagrant requires a virtualization provider like VirtualBox. Install VirtualBox from the [official website](https://www.virtualbox.org/).

## Installation

To install the monitoring stack, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/ptqa/lido-tasks.git
   lido-tasks
   ```

2. Add the `inventory.yml` file (see `inventory_example.yml`) to define your target hosts and customize configuration variables in the `group_vars` directory as needed.

3. Install dependecies:


  ```bash
  ansible-galaxy install -r requirements.yml
  ```

4. Run the Ansible playbook to install the monitoring stack components:

   ```bash
   ansible-playbook -i inventory.yml site.yml
   ```

   This command will configure Grafana, Prometheus, AlertManager, Loki, Node-Exporter, and Cadvisor on the specified hosts.

## Usage

Once the installation is complete, you can access the following components:

- **Grafana**: Visit `http://your-server-ip:3000` and log in with the credentials you have defined. Remember to change the password.

- **Prometheus**: Access Prometheus at `http://your-server-ip:9090`.

- **AlertManager**: Access AlertManager at `http://your-server-ip:9093`.

- **Loki**: Access Loki at `http://your-server-ip:3100`.

- **Node-Exporter**: Node-Exporter metrics are automatically collected on the target hosts.

- **Cadvisor**: Cadvisor metrics are automatically collected on the target hosts.

Please refer to the documentation of each component for further configuration and usage instructions.

## Testing

This project includes automated tests using Molecule and Vagrant to ensure the correctness of the Ansible roles and playbooks. To run the tests, follow these steps:

1. Install Molecule and required dependencies:

   ```bash
   pip install molecule molecule-plugins[vagrant]
   ```

2. Run the tests using the following command:

   ```bash
   molecule test
   ```

Molecule will create virtual machines using Vagrant, apply Ansible roles and playbooks, and then run tests to verify the configuration.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify it for your own purposes.
