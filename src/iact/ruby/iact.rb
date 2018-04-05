# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Iact < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @packages = []
    i = 0
    while not @_io.eof?
      @packages << Package.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Package < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @hdr = Header.new(@_io, self, @_root)
      @data = Data.new(@_io, self, @_root)
      @end_of_file = @_io.ensure_fixed_contents([255, 255, 255, 255].pack('C*'))
      self
    end
    attr_reader :hdr
    attr_reader :data
    attr_reader :end_of_file
  end
  class Data < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chanels = Array.new(32)
      (32).times { |i|
        @chanels[i] = Chanel.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :chanels
  end
  class Chanel < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @big = @_io.read_u2le
      @small = @_io.read_u2le
      self
    end
    attr_reader :big
    attr_reader :small
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([216, 11].pack('C*'))
      @sz = @_io.read_u2le
      @event_number1 = @_io.read_u4le
      @stop_position = @_io.read_u4le
      @time = Time.new(@_io, self, @_root)
      @maroc_strcut = MarocStrcut.new(@_io, self, @_root)
      self
    end
    attr_reader :magic
    attr_reader :sz
    attr_reader :event_number1
    attr_reader :stop_position
    attr_reader :time
    attr_reader :maroc_strcut
  end
  class MarocStrcut < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @maroc_nuber = @_io.read_bits_int(5)
      @skip = @_io.read_bits_int(27)
      self
    end
    attr_reader :maroc_nuber
    attr_reader :skip
  end
  class Time < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dat0 = @_io.read_u2le
      @dat1 = @_io.read_u2le
      @dat2 = @_io.read_u2le
      @dat3 = @_io.read_u2le
      self
    end
    def mls
      return @mls unless @mls.nil?
      @mls = ((dat1 & 2046) >> 1)
      @mls
    end
    def dns
      return @dns unless @dns.nil?
      @dns = ((dat0 & 127) * 10)
      @dns
    end
    def s
      return @s unless @s.nil?
      @s = (((dat1 & 63488) >> 11) | ((dat2 & 1) << 5))
      @s
    end
    def h
      return @h unless @h.nil?
      @h = ((dat2 & 3968) >> 7)
      @h
    end
    def m
      return @m unless @m.nil?
      @m = ((dat2 & 126) >> 1)
      @m
    end
    def mks
      return @mks unless @mks.nil?
      @mks = (((dat0 & 65408) >> 7) | ((dat1 & 1) << 9))
      @mks
    end
    attr_reader :dat0
    attr_reader :dat1
    attr_reader :dat2
    attr_reader :dat3
  end
  attr_reader :packages
end
