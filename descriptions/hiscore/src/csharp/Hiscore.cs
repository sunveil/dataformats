// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Hiscore : KaitaiStruct
    {
        public static Hiscore FromFile(string fileName)
        {
            return new Hiscore(new KaitaiStream(fileName));
        }

        public Hiscore(KaitaiStream p__io, KaitaiStruct p__parent = null, Hiscore p__root = null) : base(p__io)
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

            public Package(KaitaiStream p__io, Hiscore p__parent = null, Hiscore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _hdr = new Header(m_io, this, m_root);
                _data = new List<DataBlock>((int) (9));
                for (var i = 0; i < 9; i++)
                {
                    _data.Add(new DataBlock(m_io, this, m_root));
                }
                _endOfFile = m_io.EnsureFixedContents(new byte[] { 255, 255, 255, 255 });
            }
            private Header _hdr;
            private List<DataBlock> _data;
            private byte[] _endOfFile;
            private Hiscore m_root;
            private Hiscore m_parent;
            public Header Hdr { get { return _hdr; } }
            public List<DataBlock> Data { get { return _data; } }
            public byte[] EndOfFile { get { return _endOfFile; } }
            public Hiscore M_Root { get { return m_root; } }
            public Hiscore M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Hiscore.Package p__parent = null, Hiscore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.EnsureFixedContents(new byte[] { 192, 11 });
                _sz = m_io.ReadU2le();
                _eventNumber = m_io.ReadU4le();
                _stopPosition = m_io.ReadU4le();
                _time = new Time(m_io, this, m_root);
                _ip = m_io.ReadU2le();
                _stationNumber = m_io.ReadU2le();
            }
            private byte[] _magic;
            private ushort _sz;
            private uint _eventNumber;
            private uint _stopPosition;
            private Time _time;
            private ushort _ip;
            private ushort _stationNumber;
            private Hiscore m_root;
            private Hiscore.Package m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort Sz { get { return _sz; } }
            public uint EventNumber { get { return _eventNumber; } }
            public uint StopPosition { get { return _stopPosition; } }
            public Time Time { get { return _time; } }
            public ushort Ip { get { return _ip; } }
            public ushort StationNumber { get { return _stationNumber; } }
            public Hiscore M_Root { get { return m_root; } }
            public Hiscore.Package M_Parent { get { return m_parent; } }
        }
        public partial class DataBlock : KaitaiStruct
        {
            public static DataBlock FromFile(string fileName)
            {
                return new DataBlock(new KaitaiStream(fileName));
            }

            public DataBlock(KaitaiStream p__io, Hiscore.Package p__parent = null, Hiscore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _offset = m_io.ReadU2le();
                _len = m_io.ReadU2le();
                _data = new List<ushort>((int) (Len));
                for (var i = 0; i < Len; i++)
                {
                    _data.Add(m_io.ReadU2le());
                }
            }
            private ushort _offset;
            private ushort _len;
            private List<ushort> _data;
            private Hiscore m_root;
            private Hiscore.Package m_parent;
            public ushort Offset { get { return _offset; } }
            public ushort Len { get { return _len; } }
            public List<ushort> Data { get { return _data; } }
            public Hiscore M_Root { get { return m_root; } }
            public Hiscore.Package M_Parent { get { return m_parent; } }
        }
        public partial class Time : KaitaiStruct
        {
            public static Time FromFile(string fileName)
            {
                return new Time(new KaitaiStream(fileName));
            }

            public Time(KaitaiStream p__io, Hiscore.Header p__parent = null, Hiscore p__root = null) : base(p__io)
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
            private Hiscore m_root;
            private Hiscore.Header m_parent;
            public ushort Dat0 { get { return _dat0; } }
            public ushort Dat1 { get { return _dat1; } }
            public ushort Dat2 { get { return _dat2; } }
            public ushort Dat3 { get { return _dat3; } }
            public Hiscore M_Root { get { return m_root; } }
            public Hiscore.Header M_Parent { get { return m_parent; } }
        }
        private List<Package> _packages;
        private Hiscore m_root;
        private KaitaiStruct m_parent;
        public List<Package> Packages { get { return _packages; } }
        public Hiscore M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
