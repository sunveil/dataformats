-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

Grande = class.class(KaitaiStruct)

function Grande:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande:_read()
  self.packages = {}
  local i = 1
  while not self._io:is_eof() do
    self.packages[i] = Grande.Package(self._io, self, self._root)
    i = i + 1
  end
end


Grande.Package = class.class(KaitaiStruct)

Grande.Package.DataTypes = enum.Enum {
  link1 = 3032,
  link2 = 3033,
  link3 = 3034,
  link4 = 3035,
}

function Grande.Package:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande.Package:_read()
  self.data_type = Grande.Package.DataTypes(self._io:read_u2le())
  self.package_size = self._io:read_u2le()
  self.event_number = self._io:read_u4le()
  self.error_count = self._io:read_u4le()
  self.time = Grande.Time(self._io, self, self._root)
  self.cluster_info = Grande.ClusterInfo(self._io, self, self._root)
  self.data = {}
  for i = 1, 8 do
    self.data[i] = Grande.Data(self._io, self, self._root)
  end
  self.end_of_package = self._io:ensure_fixed_contents("\255\255\255\255")
end


Grande.ClusterInfo = class.class(KaitaiStruct)

function Grande.ClusterInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande.ClusterInfo:_read()
  self.cluster_number = self._io:read_bits_int(8)
  self.reserved = self._io:read_bits_int(8)
  self.optical_line_lenght = self._io:read_bits_int(16)
end


Grande.Data = class.class(KaitaiStruct)

function Grande.Data:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande.Data:_read()
  self.vme_addres = self._io:read_u4le()
  self.data_count = self._io:read_u2le()
  self.channel_info = Grande.ChannelInfo(self._io, self, self._root)
  self.data = {}
  for i = 1, self.data_count do
    self.data[i] = self._io:read_u2le()
  end
end


Grande.ChannelInfo = class.class(KaitaiStruct)

function Grande.ChannelInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande.ChannelInfo:_read()
  self.channel_number = self._io:read_bits_int(4)
  self.bank_number = self._io:read_bits_int(1)
  self.link_number = self._io:read_bits_int(2)
  self.reserved = self._io:read_bits_int(9)
end


Grande.Time = class.class(KaitaiStruct)

function Grande.Time:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Grande.Time:_read()
  self.dat0 = self._io:read_u2le()
  self.dat1 = self._io:read_u2le()
  self.dat2 = self._io:read_u2le()
  self.dat3 = self._io:read_u2le()
end

Grande.Time.property.mls = {}
function Grande.Time.property.mls:get()
  if self._m_mls ~= nil then
    return self._m_mls
  end

  self._m_mls = ((self.dat1 & 2046) >> 1)
  return self._m_mls
end

Grande.Time.property.dns = {}
function Grande.Time.property.dns:get()
  if self._m_dns ~= nil then
    return self._m_dns
  end

  self._m_dns = ((self.dat0 & 127) * 10)
  return self._m_dns
end

Grande.Time.property.s = {}
function Grande.Time.property.s:get()
  if self._m_s ~= nil then
    return self._m_s
  end

  self._m_s = (((self.dat1 & 63488) >> 11) | ((self.dat2 & 1) << 5))
  return self._m_s
end

Grande.Time.property.h = {}
function Grande.Time.property.h:get()
  if self._m_h ~= nil then
    return self._m_h
  end

  self._m_h = ((self.dat2 & 3968) >> 7)
  return self._m_h
end

Grande.Time.property.m = {}
function Grande.Time.property.m:get()
  if self._m_m ~= nil then
    return self._m_m
  end

  self._m_m = ((self.dat2 & 126) >> 1)
  return self._m_m
end

Grande.Time.property.mks = {}
function Grande.Time.property.mks:get()
  if self._m_mks ~= nil then
    return self._m_mks
  end

  self._m_mks = (((self.dat0 & 65408) >> 7) | ((self.dat1 & 1) << 9))
  return self._m_mks
end


