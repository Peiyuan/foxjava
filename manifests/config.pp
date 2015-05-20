# install fox java package
class foxjava::config {
  #Ensure install directory exists
  file { '/usr/java':
    ensure => directory,
    more   => '0755',
    owner  => 'root',
    group  => 'root',
  }
}
