-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

Iact = class.class(KaitaiStruct)

function Iact:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact:_read()
  self.packages = {}
  local i = 1
  while not self._io:is_eof() do
    self.packages[i] = Iact.Package(self._io, self, self._root)
    i = i + 1
  end
end


Iact.Package = class.class(KaitaiStruct)

function Iact.Package:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.Package:_read()
  self.header = Iact.Header(self._io, self, self._root)
  self.data = Iact.Data(self._io, self, self._root)
  self.end_of_file = self._io:ensure_fixed_contents("\255\255\255\255")
end


Iact.Data = class.class(KaitaiStruct)

function Iact.Data:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.Data:_read()
  self.chanels = {}
  for i = 1, 32 do
    self.chanels[i] = Iact.Chanel(self._io, self, self._root)
  end
end


Iact.Chanel = class.class(KaitaiStruct)

function Iact.Chanel:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.Chanel:_read()
  self.big = self._io:read_u2le()
  self.small = self._io:read_u2le()
end


Iact.MarocStruct = class.class(KaitaiStruct)

function Iact.MarocStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.MarocStruct:_read()
  self.maroc_nuber = self._io:read_bits_int(5)
  self.skip = self._io:read_bits_int(27)
end


Iact.Header = class.class(KaitaiStruct)

function Iact.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.Header:_read()
  self.magic = self._io:ensure_fixed_contents("\216\011")
  self.size = self._io:read_u2le()
  self.event_number = self._io:read_u4le()
  self.reserved = self._io:read_u4le()
  self.time = Iact.Time(self._io, self, self._root)
  self.maroc_struct = Iact.MarocStruct(self._io, self, self._root)
end


Iact.Time = class.class(KaitaiStruct)

function Iact.Time:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iact.Time:_read()
  self.dat0 = self._io:read_u2le()
  self.dat1 = self._io:read_u2le()
  self.dat2 = self._io:read_u2le()
  self.dat3 = self._io:read_u2le()
end

Iact.Time.property.mls = {}
function Iact.Time.property.mls:get()
  if self._m_mls ~= nil then
    return self._m_mls
  end

  self._m_mls = ((self.dat1 & 2046) >> 1)
  return self._m_mls
end

Iact.Time.property.dns = {}
function Iact.Time.property.dns:get()
  if self._m_dns ~= nil then
    return self._m_dns
  end

  self._m_dns = ((self.dat0 & 127) * 10)
  return self._m_dns
end

Iact.Time.property.s = {}
function Iact.Time.property.s:get()
  if self._m_s ~= nil then
    return self._m_s
  end

  self._m_s = (((self.dat1 & 63488) >> 11) | ((self.dat2 & 1) << 5))
  return self._m_s
end

Iact.Time.property.h = {}
function Iact.Time.property.h:get()
  if self._m_h ~= nil then
    return self._m_h
  end

  self._m_h = ((self.dat2 & 3968) >> 7)
  return self._m_h
end

Iact.Time.property.m = {}
function Iact.Time.property.m:get()
  if self._m_m ~= nil then
    return self._m_m
  end

  self._m_m = ((self.dat2 & 126) >> 1)
  return self._m_m
end

Iact.Time.property.mks = {}
function Iact.Time.property.mks:get()
  if self._m_mks ~= nil then
    return self._m_mks
  end

  self._m_mks = (((self.dat0 & 65408) >> 7) | ((self.dat1 & 1) << 9))
  return self._m_mks
end


