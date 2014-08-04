# Add your required timezone name here:
timezone = "PST8PDT"

# IMPORTANT : nginx needs to be restarted as well! Removed from auto restart
# to avoid downtime associdated with restarting all nginxs at once

service "sysklogd"

link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{timezone}"
  notifies :restart, resources(:service => ["sysklogd"]), :immediately
  not_if "readlink /etc/localtime | grep -q '#{timezone}$'"
end
