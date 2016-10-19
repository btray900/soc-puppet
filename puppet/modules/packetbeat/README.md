# packetbeat

A puppet module to manage packetbeat (https://www.elastic.co/products/beats/packetbeat)

## Requirements

* Puppet 2.7.x or better.
* The [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) Puppet library.
* The [file_concat](https://forge.puppetlabs.com/ispavailability/file_concat) Puppet library.

## Usage

### Main class

```
class ( '::packetbeat' )
```

### Protocols
All the protocols known to packetbeat are included and prefilled with the defaults. So to monitor apache, nginx or tomcat only the http protocol needs to be enabled.
```
packetbeat::protocol { 'http': }
```
When specific config is needed this can be passed through to the protocol. For example: elasticsearch uses the http protocol but on different ports, so the config could be
```
packetbeat::protocol { 'http':
	config => {
		ports => [9200,9300]
	}
}
```