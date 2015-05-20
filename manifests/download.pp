# download Java RPM if it doesn't exist
class foxjava::download {
  exec { 'downloadRPM':
    path    => '/usr/bin',
    cwd     => '/usr/java',
    creates => "/usr/java/${foxjava::filename}",
    command => "wget --no-cookies --no-check-certificate --header 
                \"Cookie: oraclelicense=accept-securebackup-cookie\" 
                \"${foxjava::downloadurl}\"",
    timeout => 0,
    onlyif  => "test ! -f ${foxjava::java_source}/${foxjava::filename}",
  }
}
