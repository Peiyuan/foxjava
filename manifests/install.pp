# install fox java package
class foxjava::install {
  package { $foxjava::package_name:
    ensure   => latest,
    source   => "/usr/java/${foxjava::filename}",
    provider => rpm
  }
}
