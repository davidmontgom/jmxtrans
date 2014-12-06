



package "python-yaml" do
  action :install
end

cookbook_file "#{Chef::Config[:file_cache_path]}/jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb" do
  source "jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb" 
  mode 00744
end

dpkg_package "#{Chef::Config[:file_cache_path]}/jmxtrans_20121016-175251-ab6cfd36e3-1_all.deb" do
  action :install
end

service "jmxtrans" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start]
end

#echo "jmxtrans jmxtrans/jvm_heap_size string 256" | sudo debconf-set-selections