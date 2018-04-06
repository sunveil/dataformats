# TAIGA raw data formats specification

## Kaitai Struct

[Kaitai Struct](http://kaitai.io/) is a declarative language used for describe various binary data structures, laid out in files or in memory: i.e. binary file formats, network stream packet formats, etc. 

## Supported languages

Official Kaitai Struct [compiler] now supports compiling `.ksy` into
source modules for the following languages:

* C++
* C#
* Java
* JavaScript
* Lua
* Perl
* Php
* Python
* Ruby
* and additional DOT format

## How to use

### Example for Java

To use reader you need to include Hiscore.java to project. If you use maven include this in pom file:

~~~ xml
    <dependencies>
        <dependency>
            <groupId>io.kaitai</groupId>
            <artifactId>kaitai-struct-runtime</artifactId>
            <version>0.8</version>
        </dependency>
    </dependencies>
~~~

Alternatively, you can just copy whole source code to one’s project: the library is intentionally kept as only 5 `.java` [files](https://github.com/kaitai-io/kaitai_struct_java_runtime), so it should be easy enough as well.

Parsing a structure directly from a local file:

~~~ java	
    Hiscore hiscore = Hiscore.fromFile(anExampleHiscoreFile);
~~~

Parsing a structure from a byte array (byte[]):

~~~ java	
    Hiscore hiscore = new Hiscore(new KaitaiStream(byteArray));
~~~

The hiscore file is array of packages. The file itself starts with two blocks: first comes `header` and then comes `data_block`. 

~~~ java	
	// get package
	Hiscore.Package package = hiscore.packages().get(0);
	// read package size in bytes
	System.out.println("Size: " + package.hdr().sz());
	// read event number
    System.out.println("Event number: " + package.hdr().eventNumber());
~~~

