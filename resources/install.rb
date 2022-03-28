# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html


provides :install
action :create do

  bash "installing prometheus" do
    code <<-EOH
      cd /home/vagrant
      wget https://github.com/prometheus/prometheus/releases/download/v2.33.5/prometheus-2.33.5.linux-amd64.tar.gz
      tar -xvf prometheus-2.33.5.linux-amd64.tar.gz
      cd /home/vagrant/prometheus-2.33.5.linux-amd64 
    EOH
    not_if { ::File.exist? '/home/vagrant/prometheus-2.33.5.linux-amd64' }
  end

  bash "installing node_exporter" do
    code <<-EOH
      cd /home/vagrant
      wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
      tar -xvf node_exporter-1.3.1.linux-amd64.tar.gz
      cd /home/vagrant/node_exporter-1.3.1.linux-amd64
    EOH
    not_if { ::File.exist? '/home/vagrant/node_exporter-1.3.1.linux-amd64' }
  end

  bash "installing grafana" do
    code <<-EOH
      cd /home/vagrant
      wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.4.3.linux-amd64.tar.gz
      tar -zxvf grafana-enterprise-8.4.3.linux-amd64.tar.gz
    EOH
    not_if { ::File.exist? '/home/vagrant/grafana-8.4.3' }
  end

end

