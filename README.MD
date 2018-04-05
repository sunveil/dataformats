# TAIGA raw data formats specification
## Kaitai Struct
[Kaitai Struct](http://kaitai.io/) is a declarative language used for describe various
binary data structures, laid out in files or in memory: i.e. binary
file formats, network stream packet formats, etc.
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
```xml
    <dependencies>
        <dependency>
            <groupId>io.kaitai</groupId>
            <artifactId>kaitai-struct-runtime</artifactId>
            <version>0.8</version>
        </dependency>
    </dependencies>
```