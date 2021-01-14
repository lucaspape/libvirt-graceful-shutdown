#!/usr/bin/env ruby

require "libvirt"

def vm_sync_shutdown(name)
  conn = Libvirt::open("qemu:///system")

  dom = conn.lookup_domain_by_name(name)

  # TODO: Use dom.state instead of dom.info.state when it gets available

  fail("Domain is not running") unless dom.info.state == Libvirt::Domain::RUNNING

  dom.shutdown

  puts "Shut down domain..."

  print "Waiting: "

  STDOUT.flush

  # TODO: Get rid of exception handler when above TODO is fixed

  begin
    until dom.info.state == Libvirt::Domain::SHUTOFF
      print "."
      STDOUT.flush
      sleep 1
    end
  rescue Libvirt::RetrieveError
    raise unless dom.info.state == Libvirt::Domain::SHUTOFF
  end

  puts

  conn.close
end

if __FILE__ == $0
  fail("Usage: <domain name>") unless ARGV.length == 1
  vm_sync_shutdown(ARGV[0])
end
