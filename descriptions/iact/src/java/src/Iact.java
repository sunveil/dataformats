// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class Iact extends KaitaiStruct {
    public static Iact fromFile(String fileName) throws IOException {
        return new Iact(new ByteBufferKaitaiStream(fileName));
    }

    public Iact(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Iact(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Iact(KaitaiStream _io, KaitaiStruct _parent, Iact _root) {
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

        public Package(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Package(KaitaiStream _io, Iact _parent) {
            this(_io, _parent, null);
        }

        public Package(KaitaiStream _io, Iact _parent, Iact _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.hdr = new Header(this._io, this, _root);
            this.data = new Data(this._io, this, _root);
            this.endOfFile = this._io.ensureFixedContents(new byte[] { -1, -1, -1, -1 });
        }
        private Header hdr;
        private Data data;
        private byte[] endOfFile;
        private Iact _root;
        private Iact _parent;
        public Header hdr() { return hdr; }
        public Data data() { return data; }
        public byte[] endOfFile() { return endOfFile; }
        public Iact _root() { return _root; }
        public Iact _parent() { return _parent; }
    }
    public static class Data extends KaitaiStruct {
        public static Data fromFile(String fileName) throws IOException {
            return new Data(new ByteBufferKaitaiStream(fileName));
        }

        public Data(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Data(KaitaiStream _io, Iact.Package _parent) {
            this(_io, _parent, null);
        }

        public Data(KaitaiStream _io, Iact.Package _parent, Iact _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            chanels = new ArrayList<Chanel>((int) (32));
            for (int i = 0; i < 32; i++) {
                this.chanels.add(new Chanel(this._io, this, _root));
            }
        }
        private ArrayList<Chanel> chanels;
        private Iact _root;
        private Iact.Package _parent;
        public ArrayList<Chanel> chanels() { return chanels; }
        public Iact _root() { return _root; }
        public Iact.Package _parent() { return _parent; }
    }
    public static class Chanel extends KaitaiStruct {
        public static Chanel fromFile(String fileName) throws IOException {
            return new Chanel(new ByteBufferKaitaiStream(fileName));
        }

        public Chanel(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chanel(KaitaiStream _io, Iact.Data _parent) {
            this(_io, _parent, null);
        }

        public Chanel(KaitaiStream _io, Iact.Data _parent, Iact _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.big = this._io.readU2le();
            this.small = this._io.readU2le();
        }
        private int big;
        private int small;
        private Iact _root;
        private Iact.Data _parent;
        public int big() { return big; }
        public int small() { return small; }
        public Iact _root() { return _root; }
        public Iact.Data _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Iact.Package _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Iact.Package _parent, Iact _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { -40, 11 });
            this.sz = this._io.readU2le();
            this.eventNumber1 = this._io.readU4le();
            this.stopPosition = this._io.readU4le();
            this.time = new Time(this._io, this, _root);
            this.marocStrcut = new MarocStrcut(this._io, this, _root);
        }
        private byte[] magic;
        private int sz;
        private long eventNumber1;
        private long stopPosition;
        private Time time;
        private MarocStrcut marocStrcut;
        private Iact _root;
        private Iact.Package _parent;
        public byte[] magic() { return magic; }
        public int sz() { return sz; }
        public long eventNumber1() { return eventNumber1; }
        public long stopPosition() { return stopPosition; }
        public Time time() { return time; }
        public MarocStrcut marocStrcut() { return marocStrcut; }
        public Iact _root() { return _root; }
        public Iact.Package _parent() { return _parent; }
    }
    public static class MarocStrcut extends KaitaiStruct {
        public static MarocStrcut fromFile(String fileName) throws IOException {
            return new MarocStrcut(new ByteBufferKaitaiStream(fileName));
        }

        public MarocStrcut(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MarocStrcut(KaitaiStream _io, Iact.Header _parent) {
            this(_io, _parent, null);
        }

        public MarocStrcut(KaitaiStream _io, Iact.Header _parent, Iact _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.marocNuber = this._io.readBitsInt(5);
            this.skip = this._io.readBitsInt(27);
        }
        private long marocNuber;
        private long skip;
        private Iact _root;
        private Iact.Header _parent;
        public long marocNuber() { return marocNuber; }
        public long skip() { return skip; }
        public Iact _root() { return _root; }
        public Iact.Header _parent() { return _parent; }
    }
    public static class Time extends KaitaiStruct {
        public static Time fromFile(String fileName) throws IOException {
            return new Time(new ByteBufferKaitaiStream(fileName));
        }

        public Time(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Time(KaitaiStream _io, Iact.Header _parent) {
            this(_io, _parent, null);
        }

        public Time(KaitaiStream _io, Iact.Header _parent, Iact _root) {
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
        private Iact _root;
        private Iact.Header _parent;
        public int dat0() { return dat0; }
        public int dat1() { return dat1; }
        public int dat2() { return dat2; }
        public int dat3() { return dat3; }
        public Iact _root() { return _root; }
        public Iact.Header _parent() { return _parent; }
    }
    private ArrayList<Package> packages;
    private Iact _root;
    private KaitaiStruct _parent;
    public ArrayList<Package> packages() { return packages; }
    public Iact _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
