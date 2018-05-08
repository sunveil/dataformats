-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

Trex = class.class(KaitaiStruct)

function Trex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Trex:_read()
  self.links = {}
  local i = 1
  while not self._io:is_eof() do
    self.links[i] = Trex.Link(self._io, self, self._root)
    i = i + 1
  end
end


Trex.Link = class.class(KaitaiStruct)

function Trex.Link:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Trex.Link:_read()
  self.packages = {}
  for i = 1, 4 do
    self.packages[i] = Trex.Package(self._io, self, self._root)
  end
  self.additional_info = Trex.AdditionalInfo(self._io, self, self._root)
end


Trex.Package = class.class(KaitaiStruct)

function Trex.Package:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Trex.Package:_read()
  self.header = Trex.Header(self._io, self, self._root)
  self.data = {}
  for i = 1, ((self.header.package_size - 9) / 2) do
    self.data[i] = self._io:read_u2le()
  end
  self.cluster_number = self._io:read_u1()
end


Trex.Header = class.class(KaitaiStruct)

function Trex.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Trex.Header:_read()
  self.magic = self._io:ensure_fixed_contents("\255\255")
  self.transfer_attribute = self._io:ensure_fixed_contents("\160")
  self.status = self._io:read_u1()
  self.package_size = self._io:read_u2le()
  self.request_address = self._io:read_u1()
  self.event_number = self._io:read_u4le()
  self.vme_addres = self._io:read_u4le()
end


Trex.AdditionalInfo = class.class(KaitaiStruct)

function Trex.AdditionalInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Trex.AdditionalInfo:_read()
  self.header = Trex.Header(self._io, self, self._root)
  self.data = {}
  for i = 1, ((self.header.package_size - 9) / 2) do
    self.data[i] = self._io:read_u2le()
  end
  self.cluster_number = self._io:read_u1()
  self.h = self._io:read_u2le()
  self.m = self._io:read_u2le()
  self.s = self._io:read_u2le()
  self.ms = self._io:read_u2le()
  self.optical_line_length = self._io:read_u2le()
  self.event_number = self._io:read_u4le()
end


