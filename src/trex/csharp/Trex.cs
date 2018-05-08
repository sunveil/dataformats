// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Trex : KaitaiStruct
    {
        public static Trex FromFile(string fileName)
        {
            return new Trex(new KaitaiStream(fileName));
        }

        public Trex(KaitaiStream p__io, KaitaiStruct p__parent = null, Trex p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _links = new List<Link>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _links.Add(new Link(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Link : KaitaiStruct
        {
            public static Link FromFile(string fileName)
            {
                return new Link(new KaitaiStream(fileName));
            }

            public Link(KaitaiStream p__io, Trex p__parent = null, Trex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _packages = new List<Package>((int) (4));
                for (var i = 0; i < 4; i++)
                {
                    _packages.Add(new Package(m_io, this, m_root));
                }
                _additionalInfo = new AdditionalInfo(m_io, this, m_root);
            }
            private List<Package> _packages;
            private AdditionalInfo _additionalInfo;
            private Trex m_root;
            private Trex m_parent;
            public List<Package> Packages { get { return _packages; } }
            public AdditionalInfo AdditionalInfo { get { return _additionalInfo; } }
            public Trex M_Root { get { return m_root; } }
            public Trex M_Parent { get { return m_parent; } }
        }
        public partial class Package : KaitaiStruct
        {
            public static Package FromFile(string fileName)
            {
                return new Package(new KaitaiStream(fileName));
            }

            public Package(KaitaiStream p__io, Trex.Link p__parent = null, Trex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new Header(m_io, this, m_root);
                _data = new List<ushort>((int) (((Header.PackageSize - 9) / 2)));
                for (var i = 0; i < ((Header.PackageSize - 9) / 2); i++)
                {
                    _data.Add(m_io.ReadU2le());
                }
                _clusterNumber = m_io.ReadU1();
            }
            private Header _header;
            private List<ushort> _data;
            private byte _clusterNumber;
            private Trex m_root;
            private Trex.Link m_parent;
            public Header Header { get { return _header; } }
            public List<ushort> Data { get { return _data; } }
            public byte ClusterNumber { get { return _clusterNumber; } }
            public Trex M_Root { get { return m_root; } }
            public Trex.Link M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, KaitaiStruct p__parent = null, Trex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 255, 255 });
                _transferAttribute = m_io.EnsureFixedContents(new byte[] { 160 });
                _status = m_io.ReadU1();
                _packageSize = m_io.ReadU2le();
                _requestAddress = m_io.ReadU1();
                _eventNumber = m_io.ReadU4le();
                _vmeAddres = m_io.ReadU4le();
            }
            private byte[] _magic;
            private byte[] _transferAttribute;
            private byte _status;
            private ushort _packageSize;
            private byte _requestAddress;
            private uint _eventNumber;
            private uint _vmeAddres;
            private Trex m_root;
            private KaitaiStruct m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] TransferAttribute { get { return _transferAttribute; } }
            public byte Status { get { return _status; } }
            public ushort PackageSize { get { return _packageSize; } }
            public byte RequestAddress { get { return _requestAddress; } }
            public uint EventNumber { get { return _eventNumber; } }
            public uint VmeAddres { get { return _vmeAddres; } }
            public Trex M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class AdditionalInfo : KaitaiStruct
        {
            public static AdditionalInfo FromFile(string fileName)
            {
                return new AdditionalInfo(new KaitaiStream(fileName));
            }

            public AdditionalInfo(KaitaiStream p__io, Trex.Link p__parent = null, Trex p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new Header(m_io, this, m_root);
                _data = new List<ushort>((int) (((Header.PackageSize - 9) / 2)));
                for (var i = 0; i < ((Header.PackageSize - 9) / 2); i++)
                {
                    _data.Add(m_io.ReadU2le());
                }
                _clusterNumber = m_io.ReadU1();
                _h = m_io.ReadU2le();
                _m = m_io.ReadU2le();
                _s = m_io.ReadU2le();
                _ms = m_io.ReadU2le();
                _opticalLineLength = m_io.ReadU2le();
                _eventNumber = m_io.ReadU4le();
            }
            private Header _header;
            private List<ushort> _data;
            private byte _clusterNumber;
            private ushort _h;
            private ushort _m;
            private ushort _s;
            private ushort _ms;
            private ushort _opticalLineLength;
            private uint _eventNumber;
            private Trex m_root;
            private Trex.Link m_parent;
            public Header Header { get { return _header; } }
            public List<ushort> Data { get { return _data; } }
            public byte ClusterNumber { get { return _clusterNumber; } }
            public ushort H { get { return _h; } }
            public ushort M { get { return _m; } }
            public ushort S { get { return _s; } }
            public ushort Ms { get { return _ms; } }
            public ushort OpticalLineLength { get { return _opticalLineLength; } }
            public uint EventNumber { get { return _eventNumber; } }
            public Trex M_Root { get { return m_root; } }
            public Trex.Link M_Parent { get { return m_parent; } }
        }
        private List<Link> _links;
        private Trex m_root;
        private KaitaiStruct m_parent;
        public List<Link> Links { get { return _links; } }
        public Trex M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
