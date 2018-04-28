// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Iact : KaitaiStruct
    {
        public static Iact FromFile(string fileName)
        {
            return new Iact(new KaitaiStream(fileName));
        }

        public Iact(KaitaiStream p__io, KaitaiStruct p__parent = null, Iact p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _packages = new List<Package>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _packages.Add(new Package(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Package : KaitaiStruct
        {
            public static Package FromFile(string fileName)
            {
                return new Package(new KaitaiStream(fileName));
            }

            public Package(KaitaiStream p__io, Iact p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new Header(m_io, this, m_root);
                _data = new Data(m_io, this, m_root);
                _endOfFile = m_io.EnsureFixedContents(new byte[] { 255, 255, 255, 255 });
            }
            private Header _header;
            private Data _data;
            private byte[] _endOfFile;
            private Iact m_root;
            private Iact m_parent;
            public Header Header { get { return _header; } }
            public Data Data { get { return _data; } }
            public byte[] EndOfFile { get { return _endOfFile; } }
            public Iact M_Root { get { return m_root; } }
            public Iact M_Parent { get { return m_parent; } }
        }
        public partial class Data : KaitaiStruct
        {
            public static Data FromFile(string fileName)
            {
                return new Data(new KaitaiStream(fileName));
            }

            public Data(KaitaiStream p__io, Iact.Package p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _chanels = new List<Chanel>((int) (32));
                for (var i = 0; i < 32; i++)
                {
                    _chanels.Add(new Chanel(m_io, this, m_root));
                }
            }
            private List<Chanel> _chanels;
            private Iact m_root;
            private Iact.Package m_parent;
            public List<Chanel> Chanels { get { return _chanels; } }
            public Iact M_Root { get { return m_root; } }
            public Iact.Package M_Parent { get { return m_parent; } }
        }
        public partial class Chanel : KaitaiStruct
        {
            public static Chanel FromFile(string fileName)
            {
                return new Chanel(new KaitaiStream(fileName));
            }

            public Chanel(KaitaiStream p__io, Iact.Data p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _big = m_io.ReadU2le();
                _small = m_io.ReadU2le();
            }
            private ushort _big;
            private ushort _small;
            private Iact m_root;
            private Iact.Data m_parent;
            public ushort Big { get { return _big; } }
            public ushort Small { get { return _small; } }
            public Iact M_Root { get { return m_root; } }
            public Iact.Data M_Parent { get { return m_parent; } }
        }
        public partial class MarocStruct : KaitaiStruct
        {
            public static MarocStruct FromFile(string fileName)
            {
                return new MarocStruct(new KaitaiStream(fileName));
            }

            public MarocStruct(KaitaiStream p__io, Iact.Header p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _marocNuber = m_io.ReadBitsInt(5);
                _skip = m_io.ReadBitsInt(27);
            }
            private ulong _marocNuber;
            private ulong _skip;
            private Iact m_root;
            private Iact.Header m_parent;
            public ulong MarocNuber { get { return _marocNuber; } }
            public ulong Skip { get { return _skip; } }
            public Iact M_Root { get { return m_root; } }
            public Iact.Header M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Iact.Package p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 216, 11 });
                _size = m_io.ReadU2le();
                _eventNumber = m_io.ReadU4le();
                _reserved = m_io.ReadU4le();
                _time = new Time(m_io, this, m_root);
                _marocStruct = new MarocStruct(m_io, this, m_root);
            }
            private byte[] _magic;
            private ushort _size;
            private uint _eventNumber;
            private uint _reserved;
            private Time _time;
            private MarocStruct _marocStruct;
            private Iact m_root;
            private Iact.Package m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort Size { get { return _size; } }
            public uint EventNumber { get { return _eventNumber; } }
            public uint Reserved { get { return _reserved; } }
            public Time Time { get { return _time; } }
            public MarocStruct MarocStruct { get { return _marocStruct; } }
            public Iact M_Root { get { return m_root; } }
            public Iact.Package M_Parent { get { return m_parent; } }
        }
        public partial class Time : KaitaiStruct
        {
            public static Time FromFile(string fileName)
            {
                return new Time(new KaitaiStream(fileName));
            }

            public Time(KaitaiStream p__io, Iact.Header p__parent = null, Iact p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_mls = false;
                f_dns = false;
                f_s = false;
                f_h = false;
                f_m = false;
                f_mks = false;
                _read();
            }
            private void _read()
            {
                _dat0 = m_io.ReadU2le();
                _dat1 = m_io.ReadU2le();
                _dat2 = m_io.ReadU2le();
                _dat3 = m_io.ReadU2le();
            }
            private bool f_mls;
            private int _mls;
            public int Mls
            {
                get
                {
                    if (f_mls)
                        return _mls;
                    _mls = (int) (((Dat1 & 2046) >> 1));
                    f_mls = true;
                    return _mls;
                }
            }
            private bool f_dns;
            private int _dns;
            public int Dns
            {
                get
                {
                    if (f_dns)
                        return _dns;
                    _dns = (int) (((Dat0 & 127) * 10));
                    f_dns = true;
                    return _dns;
                }
            }
            private bool f_s;
            private int _s;
            public int S
            {
                get
                {
                    if (f_s)
                        return _s;
                    _s = (int) ((((Dat1 & 63488) >> 11) | ((Dat2 & 1) << 5)));
                    f_s = true;
                    return _s;
                }
            }
            private bool f_h;
            private int _h;
            public int H
            {
                get
                {
                    if (f_h)
                        return _h;
                    _h = (int) (((Dat2 & 3968) >> 7));
                    f_h = true;
                    return _h;
                }
            }
            private bool f_m;
            private int _m;
            public int M
            {
                get
                {
                    if (f_m)
                        return _m;
                    _m = (int) (((Dat2 & 126) >> 1));
                    f_m = true;
                    return _m;
                }
            }
            private bool f_mks;
            private int _mks;
            public int Mks
            {
                get
                {
                    if (f_mks)
                        return _mks;
                    _mks = (int) ((((Dat0 & 65408) >> 7) | ((Dat1 & 1) << 9)));
                    f_mks = true;
                    return _mks;
                }
            }
            private ushort _dat0;
            private ushort _dat1;
            private ushort _dat2;
            private ushort _dat3;
            private Iact m_root;
            private Iact.Header m_parent;
            public ushort Dat0 { get { return _dat0; } }
            public ushort Dat1 { get { return _dat1; } }
            public ushort Dat2 { get { return _dat2; } }
            public ushort Dat3 { get { return _dat3; } }
            public Iact M_Root { get { return m_root; } }
            public Iact.Header M_Parent { get { return m_parent; } }
        }
        private List<Package> _packages;
        private Iact m_root;
        private KaitaiStruct m_parent;
        public List<Package> Packages { get { return _packages; } }
        public Iact M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
