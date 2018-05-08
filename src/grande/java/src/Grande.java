// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class Grande extends KaitaiStruct {
    public static Grande fromFile(String fileName) throws IOException {
        return new Grande(new ByteBufferKaitaiStream(fileName));
    }

    public Grande(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Grande(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Grande(KaitaiStream _io, KaitaiStruct _parent, Grande _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.packages = new ArrayList<Package>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.packages.add(new Package(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Package extends KaitaiStruct {
        public static Package fromFile(String fileName) throws IOException {
            return new Package(new ByteBufferKaitaiStream(fileName));
        }

        public enum DataTypes {
            LINK1(3032),
            LINK2(3033),
            LINK3(3034),
            LINK4(3035);

            private final long id;
            DataTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DataTypes> byId = new HashMap<Long, DataTypes>(4);
            static {
                for (DataTypes e : DataTypes.values())
                    byId.put(e.id(), e);
            }
            public static DataTypes byId(long id) { return byId.get(id); }
        }

        public Package(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Package(KaitaiStream _io, Grande _parent) {
            this(_io, _parent, null);
        }

        public Package(KaitaiStream _io, Grande _parent, Grande _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dataType = DataTypes.byId(this._io.readU2le());
            this.packageSize = this._io.readU2le();
            this.eventNumber = this._io.readU4le();
            this.errorCount = this._io.readU4le();
            this.time = new Time(this._io, this, _root);
            this.clusterInfo = new ClusterInfo(this._io, this, _root);
            data = new ArrayList<Data>((int) (8));
            for (int i = 0; i < 8; i++) {
                this.data.add(new Data(this._io, this, _root));
            }
            this.endOfPackage = this._io.ensureFixedContents(new byte[] { -1, -1, -1, -1 });
        }
        private DataTypes dataType;
        private int packageSize;
        private long eventNumber;
        private long errorCount;
        private Time time;
        private ClusterInfo clusterInfo;
        private ArrayList<Data> data;
        private byte[] endOfPackage;
        private Grande _root;
        private Grande _parent;
        public DataTypes dataType() { return dataType; }
        public int packageSize() { return packageSize; }
        public long eventNumber() { return eventNumber; }
        public long errorCount() { return errorCount; }
        public Time time() { return time; }
        public ClusterInfo clusterInfo() { return clusterInfo; }
        public ArrayList<Data> data() { return data; }
        public byte[] endOfPackage() { return endOfPackage; }
        public Grande _root() { return _root; }
        public Grande _parent() { return _parent; }
    }
    public static class ClusterInfo extends KaitaiStruct {
        public static ClusterInfo fromFile(String fileName) throws IOException {
            return new ClusterInfo(new ByteBufferKaitaiStream(fileName));
        }

        public ClusterInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ClusterInfo(KaitaiStream _io, Grande.Package _parent) {
            this(_io, _parent, null);
        }

        public ClusterInfo(KaitaiStream _io, Grande.Package _parent, Grande _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.clusterNumber = this._io.readBitsInt(8);
            this.reserved = this._io.readBitsInt(8);
            this.opticalLineLenght = this._io.readBitsInt(16);
        }
        private long clusterNumber;
        private long reserved;
        private long opticalLineLenght;
        private Grande _root;
        private Grande.Package _parent;
        public long clusterNumber() { return clusterNumber; }
        public long reserved() { return reserved; }
        public long opticalLineLenght() { return opticalLineLenght; }
        public Grande _root() { return _root; }
        public Grande.Package _parent() { return _parent; }
    }
    public static class Data extends KaitaiStruct {
        public static Data fromFile(String fileName) throws IOException {
            return new Data(new ByteBufferKaitaiStream(fileName));
        }

        public Data(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Data(KaitaiStream _io, Grande.Package _parent) {
            this(_io, _parent, null);
        }

        public Data(KaitaiStream _io, Grande.Package _parent, Grande _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.vmeAddres = this._io.readU4le();
            this.dataCount = this._io.readU2le();
            this.channelInfo = new ChannelInfo(this._io, this, _root);
            data = new ArrayList<Integer>((int) (dataCount()));
            for (int i = 0; i < dataCount(); i++) {
                this.data.add(this._io.readU2le());
            }
        }
        private long vmeAddres;
        private int dataCount;
        private ChannelInfo channelInfo;
        private ArrayList<Integer> data;
        private Grande _root;
        private Grande.Package _parent;
        public long vmeAddres() { return vmeAddres; }
        public int dataCount() { return dataCount; }
        public ChannelInfo channelInfo() { return channelInfo; }
        public ArrayList<Integer> data() { return data; }
        public Grande _root() { return _root; }
        public Grande.Package _parent() { return _parent; }
    }
    public static class ChannelInfo extends KaitaiStruct {
        public static ChannelInfo fromFile(String fileName) throws IOException {
            return new ChannelInfo(new ByteBufferKaitaiStream(fileName));
        }

        public ChannelInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChannelInfo(KaitaiStream _io, Grande.Data _parent) {
            this(_io, _parent, null);
        }

        public ChannelInfo(KaitaiStream _io, Grande.Data _parent, Grande _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.channelNumber = this._io.readBitsInt(4);
            this.bankNumber = this._io.readBitsInt(1) != 0;
            this.linkNumber = this._io.readBitsInt(2);
            this.reserved = this._io.readBitsInt(9);
        }
        private long channelNumber;
        private boolean bankNumber;
        private long linkNumber;
        private long reserved;
        private Grande _root;
        private Grande.Data _parent;
        public long channelNumber() { return channelNumber; }
        public boolean bankNumber() { return bankNumber; }
        public long linkNumber() { return linkNumber; }
        public long reserved() { return reserved; }
        public Grande _root() { return _root; }
        public Grande.Data _parent() { return _parent; }
    }
    public static class Time extends KaitaiStruct {
        public static Time fromFile(String fileName) throws IOException {
            return new Time(new ByteBufferKaitaiStream(fileName));
        }

        public Time(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Time(KaitaiStream _io, Grande.Package _parent) {
            this(_io, _parent, null);
        }

        public Time(KaitaiStream _io, Grande.Package _parent, Grande _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dat0 = this._io.readU2le();
            this.dat1 = this._io.readU2le();
            this.dat2 = this._io.readU2le();
            this.dat3 = this._io.readU2le();
        }
        private Integer mls;
        public Integer mls() {
            if (this.mls != null)
                return this.mls;
            int _tmp = (int) (((dat1() & 2046) >> 1));
            this.mls = _tmp;
            return this.mls;
        }
        private Integer dns;
        public Integer dns() {
            if (this.dns != null)
                return this.dns;
            int _tmp = (int) (((dat0() & 127) * 10));
            this.dns = _tmp;
            return this.dns;
        }
        private Integer s;
        public Integer s() {
            if (this.s != null)
                return this.s;
            int _tmp = (int) ((((dat1() & 63488) >> 11) | ((dat2() & 1) << 5)));
            this.s = _tmp;
            return this.s;
        }
        private Integer h;
        public Integer h() {
            if (this.h != null)
                return this.h;
            int _tmp = (int) (((dat2() & 3968) >> 7));
            this.h = _tmp;
            return this.h;
        }
        private Integer m;
        public Integer m() {
            if (this.m != null)
                return this.m;
            int _tmp = (int) (((dat2() & 126) >> 1));
            this.m = _tmp;
            return this.m;
        }
        private Integer mks;
        public Integer mks() {
            if (this.mks != null)
                return this.mks;
            int _tmp = (int) ((((dat0() & 65408) >> 7) | ((dat1() & 1) << 9)));
            this.mks = _tmp;
            return this.mks;
        }
        private int dat0;
        private int dat1;
        private int dat2;
        private int dat3;
        private Grande _root;
        private Grande.Package _parent;
        public int dat0() { return dat0; }
        public int dat1() { return dat1; }
        public int dat2() { return dat2; }
        public int dat3() { return dat3; }
        public Grande _root() { return _root; }
        public Grande.Package _parent() { return _parent; }
    }
    private ArrayList<Package> packages;
    private Grande _root;
    private KaitaiStruct _parent;
    public ArrayList<Package> packages() { return packages; }
    public Grande _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
