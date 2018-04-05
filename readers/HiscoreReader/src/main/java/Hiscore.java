// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class Hiscore extends KaitaiStruct {
    public static Hiscore fromFile(String fileName) throws IOException {
        return new Hiscore(new ByteBufferKaitaiStream(fileName));
    }

    public Hiscore(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Hiscore(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Hiscore(KaitaiStream _io, KaitaiStruct _parent, Hiscore _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        data = new ArrayList<DataBlock>((int) (9));
        for (int i = 0; i < 9; i++) {
            this.data.add(new DataBlock(this._io, this, _root));
        }
        this.endOfFile = this._io.ensureFixedContents(new byte[] { -1, -1, -1, -1 });
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Hiscore _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Hiscore _parent, Hiscore _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { -64, 11 });
            this.sz = this._io.readU2le();
            this.eventNumber = this._io.readU4le();
            this.stopPosition = this._io.readU4le();
            this.time = new Time(this._io, this, _root);
            this.ip = this._io.readU2le();
            this.stationNumber = this._io.readU2le();
        }
        private byte[] magic;
        private int sz;
        private long eventNumber;
        private long stopPosition;
        private Time time;
        private int ip;
        private int stationNumber;
        private Hiscore _root;
        private Hiscore _parent;
        public byte[] magic() { return magic; }
        public int sz() { return sz; }
        public long eventNumber() { return eventNumber; }
        public long stopPosition() { return stopPosition; }
        public Time time() { return time; }
        public int ip() { return ip; }
        public int stationNumber() { return stationNumber; }
        public Hiscore _root() { return _root; }
        public Hiscore _parent() { return _parent; }
    }
    public static class DataBlock extends KaitaiStruct {
        public static DataBlock fromFile(String fileName) throws IOException {
            return new DataBlock(new ByteBufferKaitaiStream(fileName));
        }

        public DataBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataBlock(KaitaiStream _io, Hiscore _parent) {
            this(_io, _parent, null);
        }

        public DataBlock(KaitaiStream _io, Hiscore _parent, Hiscore _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.offset = this._io.readU2le();
            this.len = this._io.readU2le();
            data = new ArrayList<Integer>((int) (len()));
            for (int i = 0; i < len(); i++) {
                this.data.add(this._io.readU2le());
            }
        }
        private int offset;
        private int len;
        private ArrayList<Integer> data;
        private Hiscore _root;
        private Hiscore _parent;
        public int offset() { return offset; }
        public int len() { return len; }
        public ArrayList<Integer> data() { return data; }
        public Hiscore _root() { return _root; }
        public Hiscore _parent() { return _parent; }
    }
    public static class Time extends KaitaiStruct {
        public static Time fromFile(String fileName) throws IOException {
            return new Time(new ByteBufferKaitaiStream(fileName));
        }

        public Time(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Time(KaitaiStream _io, Hiscore.Header _parent) {
            this(_io, _parent, null);
        }

        public Time(KaitaiStream _io, Hiscore.Header _parent, Hiscore _root) {
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
        private Hiscore _root;
        private Hiscore.Header _parent;
        public int dat0() { return dat0; }
        public int dat1() { return dat1; }
        public int dat2() { return dat2; }
        public int dat3() { return dat3; }
        public Hiscore _root() { return _root; }
        public Hiscore.Header _parent() { return _parent; }
    }
    private Header hdr;
    private ArrayList<DataBlock> data;
    private byte[] endOfFile;
    private Hiscore _root;
    private KaitaiStruct _parent;
    public Header hdr() { return hdr; }
    public ArrayList<DataBlock> data() { return data; }
    public byte[] endOfFile() { return endOfFile; }
    public Hiscore _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
