-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

Hiscore = class.class(KaitaiStruct)

function Hiscore:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hiscore:_read()
  self.packages = {}
  local i = 1
  while not self._io:is_eof() do
    self.packages[i] = Hiscore.Package(self._io, self, self._root)
    i = i + 1
  end
end


Hiscore.Package = class.class(KaitaiStruct)

function Hiscore.Package:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hiscore.Package:_read()
  self.hdr = Hiscore.Header(self._io, self, self._root)
  self.data = {}
  for i = 1, 9 do
    self.data[i] = Hiscore.DataBlock(self._io, self, self._root)
  end
  self.end_of_file = self._io:ensure_fixed_contents("\255\255\255\255")
end


Hiscore.Header = class.class(KaitaiStruct)

function Hiscore.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hiscore.Header:_read()
  self.magic = self._io:ensure_fixed_contents("\192\011")
  self.sz = self._io:read_u2le()
  self.event_number = self._io:read_u4le()
  self.stop_position = self._io:read_u4le()
  self.time = Hiscore.Time(self._io, self, self._root)
  self.ip = self._io:read_u2le()
  self.station_number = self._io:read_u2le()
end


Hiscore.DataBlock = class.class(KaitaiStruct)

function Hiscore.DataBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hiscore.DataBlock:_read()
  self.offset = self._io:read_u2le()
  self.len = self._io:read_u2le()
  self.data = {}
  for i = 1, self.len do
    self.data[i] = self._io:read_u2le()
  end
end


Hiscore.Time = class.class(KaitaiStruct)

function Hiscore.Time:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Hiscore.Time:_read()
  self.dat0 = self._io:read_u2le()
  self.dat1 = self._io:read_u2le()
  self.dat2 = self._io:read_u2le()
  self.dat3 = self._io:read_u2le()
end

Hiscore.Time.property.mls = {}
function Hiscore.Time.property.mls:get()
  if self._m_mls ~= nil then
    return self._m_mls
  end

  self._m_mls = ((self.dat1 & 2046) >> 1)
  return self._m_mls
end

Hiscore.Time.property.dns = {}
function Hiscore.Time.property.dns:get()
  if self._m_dns ~= nil then
    return self._m_dns
  end

  self._m_dns = ((self.dat0 & 127) * 10)
  return self._m_dns
end

Hiscore.Time.property.s = {}
function Hiscore.Time.property.s:get()
  if self._m_s ~= nil then
    return self._m_s
  end

  self._m_s = (((self.dat1 & 63488) >> 11) | ((self.dat2 & 1) << 5))
  return self._m_s
end

Hiscore.Time.property.h = {}
function Hiscore.Time.property.h:get()
  if self._m_h ~= nil then
    return self._m_h
  end

  self._m_h = ((self.dat2 & 3968) >> 7)
  return self._m_h
end

Hiscore.Time.property.m = {}
function Hiscore.Time.property.m:get()
  if self._m_m ~= nil then
    return self._m_m
  end

  self._m_m = ((self.dat2 & 126) >> 1)
  return self._m_m
end

Hiscore.Time.property.mks = {}
function Hiscore.Time.property.mks:get()
  if self._m_mks ~= nil then
    return self._m_mks
  end

  self._m_mks = (((self.dat0 & 65408) >> 7) | ((self.dat1 & 1) << 9))
  return self._m_mks
end


