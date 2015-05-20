# == Class: foxjava
#
# Full description of class foxjava here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'foxjava':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class foxjava (
  $version      = '7',
  $type         = 'jdk',
  $sys_arch     = 'x64',
){
  #Set the filename and download url
  if $version == '7' {
    $version_detail = '7u80'
    $build_num      = '-b15'
    $package_name   = 'jdk1.7.0_80'
  } elsif $version == '8' {
    $version_detail = '8u45'
    $build_num      = '-b14'
    $package_name   = 'jdk1.8.0_45'
  } else {
    fail('java version is not supported')
  }
  
  $filename       = "${type}-${version_detail}-linux-${sys_arch}.rpm"
  $download_url   = "http://download.oracle.com/otn-pub/java/jdk/${version_detail}${build_num}/${filename}"

  include foxjava::config
  include foxjava::download
  include foxjava::install
}
