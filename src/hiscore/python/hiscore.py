# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Hiscore(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.packages = []
        i = 0
        while not self._io.is_eof():
            self.packages.append(self._root.Package(self._io, self, self._root))
            i += 1


    class Package(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.hdr = self._root.Header(self._io, self, self._root)
            self.data = [None] * (9)
            for i in range(9):
                self.data[i] = self._root.DataBlock(self._io, self, self._root)

            self.end_of_file = self._io.ensure_fixed_contents(b"\xFF\xFF\xFF\xFF")


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\xC0\x0B")
            self.sz = self._io.read_u2le()
            self.event_number = self._io.read_u4le()
            self.stop_position = self._io.read_u4le()
            self.time = self._root.Time(self._io, self, self._root)
            self.ip = self._io.read_u2le()
            self.station_number = self._io.read_u2le()


    class DataBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.offset = self._io.read_u2le()
            self.len = self._io.read_u2le()
            self.data = [None] * (self.len)
            for i in range(self.len):
                self.data[i] = self._io.read_u2le()



    class Time(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.dat0 = self._io.read_u2le()
            self.dat1 = self._io.read_u2le()
            self.dat2 = self._io.read_u2le()
            self.dat3 = self._io.read_u2le()

        @property
        def mls(self):
            if hasattr(self, '_m_mls'):
                return self._m_mls if hasattr(self, '_m_mls') else None

            self._m_mls = ((self.dat1 & 2046) >> 1)
            return self._m_mls if hasattr(self, '_m_mls') else None

        @property
        def dns(self):
            if hasattr(self, '_m_dns'):
                return self._m_dns if hasattr(self, '_m_dns') else None

            self._m_dns = ((self.dat0 & 127) * 10)
            return self._m_dns if hasattr(self, '_m_dns') else None

        @property
        def s(self):
            if hasattr(self, '_m_s'):
                return self._m_s if hasattr(self, '_m_s') else None

            self._m_s = (((self.dat1 & 63488) >> 11) | ((self.dat2 & 1) << 5))
            return self._m_s if hasattr(self, '_m_s') else None

        @property
        def h(self):
            if hasattr(self, '_m_h'):
                return self._m_h if hasattr(self, '_m_h') else None

            self._m_h = ((self.dat2 & 3968) >> 7)
            return self._m_h if hasattr(self, '_m_h') else None

        @property
        def m(self):
            if hasattr(self, '_m_m'):
                return self._m_m if hasattr(self, '_m_m') else None

            self._m_m = ((self.dat2 & 126) >> 1)
            return self._m_m if hasattr(self, '_m_m') else None

        @property
        def mks(self):
            if hasattr(self, '_m_mks'):
                return self._m_mks if hasattr(self, '_m_mks') else None

            self._m_mks = (((self.dat0 & 65408) >> 7) | ((self.dat1 & 1) << 9))
            return self._m_mks if hasattr(self, '_m_mks') else None



