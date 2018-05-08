// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Grande : KaitaiStruct
    {
        public static Grande FromFile(string fileName)
        {
            return new Grande(new KaitaiStream(fileName));
        }

        public Grande(KaitaiStream p__io, KaitaiStruct p__parent = null, Grande p__root = null) : base(p__io)
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


            public enum DataTypes
            {
                Link1 = 3032,
                Link2 = 3033,
                Link3 = 3034,
                Link4 = 3035,
            }
            public Package(KaitaiStream p__io, Grande p__parent = null, Grande p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _dataType = ((DataTypes) m_io.ReadU2le());
                _packageSize = m_io.ReadU2le();
                _eventNumber = m_io.ReadU4le();
                _errorCount = m_io.ReadU4le();
                _time = new Time(m_io, this, m_root);
                _clusterInfo = new ClusterInfo(m_io, this, m_root);
                _data = new List<Data>((int) (8));
                for (var i = 0; i < 8; i++)
                {
                    _data.Add(new Data(m_io, this, m_root));
                }
                _endOfPackage = m_io.EnsureFixedContents(new byte[] { 255, 255, 255, 255 });
            }
            private DataTypes _dataType;
            private ushort _packageSize;
            private uint _eventNumber;
            private uint _errorCount;
            private Time _time;
            private ClusterInfo _clusterInfo;
            private List<Data> _data;
            private byte[] _endOfPackage;
            private Grande m_root;
            private Grande m_parent;
            public DataTypes DataType { get { return _dataType; } }
            public ushort PackageSize { get { return _packageSize; } }
            public uint EventNumber { get { return _eventNumber; } }
            public uint ErrorCount { get { return _errorCount; } }
            public Time Time { get { return _time; } }
            public ClusterInfo ClusterInfo { get { return _clusterInfo; } }
            public List<Data> Data { get { return _data; } }
            public byte[] EndOfPackage { get { return _endOfPackage; } }
            public Grande M_Root { get { return m_root; } }
            public Grande M_Parent { get { return m_parent; } }
        }
        public partial class ClusterInfo : KaitaiStruct
        {
            public static ClusterInfo FromFile(string fileName)
            {
                return new ClusterInfo(new KaitaiStream(fileName));
            }

            public ClusterInfo(KaitaiStream p__io, Grande.Package p__parent = null, Grande p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _clusterNumber = m_io.ReadBitsInt(8);
                _reserved = m_io.ReadBitsInt(8);
                _opticalLineLenght = m_io.ReadBitsInt(16);
            }
            private ulong _clusterNumber;
            private ulong _reserved;
            private ulong _opticalLineLenght;
            private Grande m_root;
            private Grande.Package m_parent;
            public ulong ClusterNumber { get { return _clusterNumber; } }
            public ulong Reserved { get { return _reserved; } }
            public ulong OpticalLineLenght { get { return _opticalLineLenght; } }
            public Grande M_Root { get { return m_root; } }
            public Grande.Package M_Parent { get { return m_parent; } }
        }
        public partial class Data : KaitaiStruct
        {
            public static Data FromFile(string fileName)
            {
                return new Data(new KaitaiStream(fileName));
            }

            public Data(KaitaiStream p__io, Grande.Package p__parent = null, Grande p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _vmeAddres = m_io.ReadU4le();
                _dataCount = m_io.ReadU2le();
                _channelInfo = new ChannelInfo(m_io, this, m_root);
                _data = new List<ushort>((int) (DataCount));
                for (var i = 0; i < DataCount; i++)
                {
                    _data.Add(m_io.ReadU2le());
                }
            }
            private uint _vmeAddres;
            private ushort _dataCount;
            private ChannelInfo _channelInfo;
            private List<ushort> _data;
            private Grande m_root;
            private Grande.Package m_parent;
            public uint VmeAddres { get { return _vmeAddres; } }
            public ushort DataCount { get { return _dataCount; } }
            public ChannelInfo ChannelInfo { get { return _channelInfo; } }
            public List<ushort> Data { get { return _data; } }
            public Grande M_Root { get { return m_root; } }
            public Grande.Package M_Parent { get { return m_parent; } }
        }
        public partial class ChannelInfo : KaitaiStruct
        {
            public static ChannelInfo FromFile(string fileName)
            {
                return new ChannelInfo(new KaitaiStream(fileName));
            }

            public ChannelInfo(KaitaiStream p__io, Grande.Data p__parent = null, Grande p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _channelNumber = m_io.ReadBitsInt(4);
                _bankNumber = m_io.ReadBitsInt(1) != 0;
                _linkNumber = m_io.ReadBitsInt(2);
                _reserved = m_io.ReadBitsInt(9);
            }
            private ulong _channelNumber;
            private bool _bankNumber;
            private ulong _linkNumber;
            private ulong _reserved;
            private Grande m_root;
            private Grande.Data m_parent;
            public ulong ChannelNumber { get { return _channelNumber; } }
            public bool BankNumber { get { return _bankNumber; } }
            public ulong LinkNumber { get { return _linkNumber; } }
            public ulong Reserved { get { return _reserved; } }
            public Grande M_Root { get { return m_root; } }
            public Grande.Data M_Parent { get { return m_parent; } }
        }
        public partial class Time : KaitaiStruct
        {
            public static Time FromFile(string fileName)
            {
                return new Time(new KaitaiStream(fileName));
            }

            public Time(KaitaiStream p__io, Grande.Package p__parent = null, Grande p__root = null) : base(p__io)
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
            private Grande m_root;
            private Grande.Package m_parent;
            public ushort Dat0 { get { return _dat0; } }
            public ushort Dat1 { get { return _dat1; } }
            public ushort Dat2 { get { return _dat2; } }
            public ushort Dat3 { get { return _dat3; } }
            public Grande M_Root { get { return m_root; } }
            public Grande.Package M_Parent { get { return m_parent; } }
        }
        private List<Package> _packages;
        private Grande m_root;
        private KaitaiStruct m_parent;
        public List<Package> Packages { get { return _packages; } }
        public Grande M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
