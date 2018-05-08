# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Grande < Kaitai::Struct::Struct
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

    DATA_TYPES = {
      3032 => :data_types_link1,
      3033 => :data_types_link2,
      3034 => :data_types_link3,
      3035 => :data_types_link4,
    }
    I__DATA_TYPES = DATA_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data_type = Kaitai::Struct::Stream::resolve_enum(DATA_TYPES, @_io.read_u2le)
      @package_size = @_io.read_u2le
      @event_number = @_io.read_u4le
      @error_count = @_io.read_u4le
      @time = Time.new(@_io, self, @_root)
      @cluster_info = ClusterInfo.new(@_io, self, @_root)
      @data = Array.new(8)
      (8).times { |i|
        @data[i] = Data.new(@_io, self, @_root)
      }
      @end_of_package = @_io.ensure_fixed_contents([255, 255, 255, 255].pack('C*'))
      self
    end
    attr_reader :data_type
    attr_reader :package_size
    attr_reader :event_number
    attr_reader :error_count
    attr_reader :time
    attr_reader :cluster_info
    attr_reader :data
    attr_reader :end_of_package
  end
  class ClusterInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cluster_number = @_io.read_bits_int(8)
      @reserved = @_io.read_bits_int(8)
      @optical_line_lenght = @_io.read_bits_int(16)
      self
    end
    attr_reader :cluster_number
    attr_reader :reserved
    attr_reader :optical_line_lenght
  end
  class Data < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @vme_addres = @_io.read_u4le
      @data_count = @_io.read_u2le
      @channel_info = ChannelInfo.new(@_io, self, @_root)
      @data = Array.new(data_count)
      (data_count).times { |i|
        @data[i] = @_io.read_u2le
      }
      self
    end
    attr_reader :vme_addres
    attr_reader :data_count
    attr_reader :channel_info
    attr_reader :data
  end
  class ChannelInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @channel_number = @_io.read_bits_int(4)
      @bank_number = @_io.read_bits_int(1) != 0
      @link_number = @_io.read_bits_int(2)
      @reserved = @_io.read_bits_int(9)
      self
    end
    attr_reader :channel_number
    attr_reader :bank_number
    attr_reader :link_number
    attr_reader :reserved
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
