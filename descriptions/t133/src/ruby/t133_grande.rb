# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class T133Grande < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @links = []
    i = 0
    while not @_io.eof?
      @links << Link.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Link < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @packages = Array.new(32)
      (32).times { |i|
        @packages[i] = Package.new(@_io, self, @_root)
      }
      @additional_info = AdditionalInfo.new(@_io, self, @_root)
      self
    end
    attr_reader :packages
    attr_reader :additional_info
  end
  class Package < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @h = @_io.read_u2le
      @m = @_io.read_u2le
      @s = @_io.read_u2le
      @ms = @_io.read_u2le
      @optical_line_length = @_io.read_u2le
      @event_number = @_io.read_u4le
      self
    end
    attr_reader :h
    attr_reader :m
    attr_reader :s
    attr_reader :ms
    attr_reader :optical_line_length
    attr_reader :event_number
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([255, 255].pack('C*'))
      @transfer_attribute = @_io.ensure_fixed_contents([160].pack('C*'))
      @status = @_io.read_u1
      @package_size = @_io.read_u2le
      @request_address = @_io.read_u1
      @event_number = @_io.read_u4le
      @vme_addres = @_io.read_u4le
      self
    end
    attr_reader :magic
    attr_reader :transfer_attribute
    attr_reader :status
    attr_reader :package_size
    attr_reader :request_address
    attr_reader :event_number
    attr_reader :vme_addres
  end
  class AdditionalInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = Header.new(@_io, self, @_root)
      @data = Array.new(((header.package_size - 9) / 2))
      (((header.package_size - 9) / 2)).times { |i|
        @data[i] = @_io.read_u2le
      }
      @cluster_number = @_io.read_u1
      @h = @_io.read_u2le
      @m = @_io.read_u2le
      @s = @_io.read_u2le
      @ms = @_io.read_u2le
      @optical_line_length = @_io.read_u2le
      @event_number = @_io.read_u4le
      self
    end
    attr_reader :header
    attr_reader :data
    attr_reader :cluster_number
    attr_reader :h
    attr_reader :m
    attr_reader :s
    attr_reader :ms
    attr_reader :optical_line_length
    attr_reader :event_number
  end
  attr_reader :links
end
