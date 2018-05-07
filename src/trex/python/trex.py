# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Trex(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.links = []
        i = 0
        while not self._io.is_eof():
            self.links.append(self._root.Link(self._io, self, self._root))
            i += 1


    class Link(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.packages = [None] * (4)
            for i in range(4):
                self.packages[i] = self._root.Package(self._io, self, self._root)

            self.additional_info = self._root.AdditionalInfo(self._io, self, self._root)


    class Package(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.h = self._io.read_u2le()
            self.m = self._io.read_u2le()
            self.s = self._io.read_u2le()
            self.ms = self._io.read_u2le()
            self.optical_line_length = self._io.read_u2le()
            self.event_number = self._io.read_u4le()


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\xFF\xFF")
            self.transfer_attribute = self._io.ensure_fixed_contents(b"\xA0")
            self.status = self._io.read_u1()
            self.package_size = self._io.read_u2le()
            self.request_address = self._io.read_u1()
            self.event_number = self._io.read_u4le()
            self.vme_addres = self._io.read_u4le()


    class AdditionalInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.Header(self._io, self, self._root)
            self.data = [None] * ((self.header.package_size - 9) // 2)
            for i in range((self.header.package_size - 9) // 2):
                self.data[i] = self._io.read_u2le()

            self.cluster_number = self._io.read_u1()
            self.h = self._io.read_u2le()
            self.m = self._io.read_u2le()
            self.s = self._io.read_u2le()
            self.ms = self._io.read_u2le()
            self.optical_line_length = self._io.read_u2le()
            self.event_number = self._io.read_u4le()



