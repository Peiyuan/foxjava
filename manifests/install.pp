# install fox java package
class foxjava::install {
  package { $foxjava::type:
    ensure   => latest,
    source   => "/usr/java/${foxjava::filename}",
    provider => rpm
  }
}
