import os
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
            os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

def test_is_docker_installed(host):
    package_docker = host.package('docker-ce')
    assert package_docker.is_installed

def test_is_docker_service(host):
    service_docker = host.service('docker')
    assert service_docker.is_running

def test_is_grafana_service(host):
    service_grafana = host.service('docker')
    assert service_grafana.is_running

def test_is_grafana_container(host):
    container_grafana = host.docker.get_containers(status="running", name='gc-grafana')
    assert container_grafana

def test_is_loki_container(host):
    container_loki = host.docker.get_containers(status="running", name='gc-loki')
    assert container_loki

def test_is_cadvisor_container(host):
    container_cadvisor = host.docker.get_containers(status="running", name='gc-cadvisor')
    assert container_cadvisor

def test_is_prometheus_container(host):
    container_prometheus = host.docker.get_containers(status="running", name='gc-prometheus')
    assert container_prometheus

def test_is_alertmanager_container(host):
    container_alertmanager = host.docker.get_containers(status="running", name='gc-alertmanager')
    assert container_alertmanager

def test_is_promtail_container(host):
    container_promtail = host.docker.get_containers(status="running", name='gc-promtail')
    assert container_promtail
