// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class Trex extends KaitaiStruct {
    public static Trex fromFile(String fileName) throws IOException {
        return new Trex(new ByteBufferKaitaiStream(fileName));
    }

    public Trex(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Trex(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Trex(KaitaiStream _io, KaitaiStruct _parent, Trex _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.links = new ArrayList<Link>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.links.add(new Link(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Link extends KaitaiStruct {
        public static Link fromFile(String fileName) throws IOException {
            return new Link(new ByteBufferKaitaiStream(fileName));
        }

        public Link(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Link(KaitaiStream _io, Trex _parent) {
            this(_io, _parent, null);
        }

        public Link(KaitaiStream _io, Trex _parent, Trex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            packages = new ArrayList<Package>((int) (4));
            for (int i = 0; i < 4; i++) {
                this.packages.add(new Package(this._io, this, _root));
            }
            this.additionalInfo = new AdditionalInfo(this._io, this, _root);
        }
        private ArrayList<Package> packages;
        private AdditionalInfo additionalInfo;
        private Trex _root;
        private Trex _parent;
        public ArrayList<Package> packages() { return packages; }
        public AdditionalInfo additionalInfo() { return additionalInfo; }
        public Trex _root() { return _root; }
        public Trex _parent() { return _parent; }
    }
    public static class Package extends KaitaiStruct {
        public static Package fromFile(String fileName) throws IOException {
            return new Package(new ByteBufferKaitaiStream(fileName));
        }

        public Package(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Package(KaitaiStream _io, Trex.Link _parent) {
            this(_io, _parent, null);
        }

        public Package(KaitaiStream _io, Trex.Link _parent, Trex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.h = this._io.readU2le();
            this.m = this._io.readU2le();
            this.s = this._io.readU2le();
            this.ms = this._io.readU2le();
            this.opticalLineLength = this._io.readU2le();
            this.eventNumber = this._io.readU4le();
        }
        private int h;
        private int m;
        private int s;
        private int ms;
        private int opticalLineLength;
        private long eventNumber;
        private Trex _root;
        private Trex.Link _parent;
        public int h() { return h; }
        public int m() { return m; }
        public int s() { return s; }
        public int ms() { return ms; }
        public int opticalLineLength() { return opticalLineLength; }
        public long eventNumber() { return eventNumber; }
        public Trex _root() { return _root; }
        public Trex.Link _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Trex.AdditionalInfo _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Trex.AdditionalInfo _parent, Trex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { -1, -1 });
            this.transferAttribute = this._io.ensureFixedContents(new byte[] { -96 });
            this.status = this._io.readU1();
            this.packageSize = this._io.readU2le();
            this.requestAddress = this._io.readU1();
            this.eventNumber = this._io.readU4le();
            this.vmeAddres = this._io.readU4le();
        }
        private byte[] magic;
        private byte[] transferAttribute;
        private int status;
        private int packageSize;
        private int requestAddress;
        private long eventNumber;
        private long vmeAddres;
        private Trex _root;
        private Trex.AdditionalInfo _parent;
        public byte[] magic() { return magic; }
        public byte[] transferAttribute() { return transferAttribute; }
        public int status() { return status; }
        public int packageSize() { return packageSize; }
        public int requestAddress() { return requestAddress; }
        public long eventNumber() { return eventNumber; }
        public long vmeAddres() { return vmeAddres; }
        public Trex _root() { return _root; }
        public Trex.AdditionalInfo _parent() { return _parent; }
    }
    public static class AdditionalInfo extends KaitaiStruct {
        public static AdditionalInfo fromFile(String fileName) throws IOException {
            return new AdditionalInfo(new ByteBufferKaitaiStream(fileName));
        }

        public AdditionalInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AdditionalInfo(KaitaiStream _io, Trex.Link _parent) {
            this(_io, _parent, null);
        }

        public AdditionalInfo(KaitaiStream _io, Trex.Link _parent, Trex _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new Header(this._io, this, _root);
            data = new ArrayList<Integer>((int) (((header().packageSize() - 9) / 2)));
            for (int i = 0; i < ((header().packageSize() - 9) / 2); i++) {
                this.data.add(this._io.readU2le());
            }
            this.clusterNumber = this._io.readU1();
            this.h = this._io.readU2le();
            this.m = this._io.readU2le();
            this.s = this._io.readU2le();
            this.ms = this._io.readU2le();
            this.opticalLineLength = this._io.readU2le();
            this.eventNumber = this._io.readU4le();
        }
        private Header header;
        private ArrayList<Integer> data;
        private int clusterNumber;
        private int h;
        private int m;
        private int s;
        private int ms;
        private int opticalLineLength;
        private long eventNumber;
        private Trex _root;
        private Trex.Link _parent;
        public Header header() { return header; }
        public ArrayList<Integer> data() { return data; }
        public int clusterNumber() { return clusterNumber; }
        public int h() { return h; }
        public int m() { return m; }
        public int s() { return s; }
        public int ms() { return ms; }
        public int opticalLineLength() { return opticalLineLength; }
        public long eventNumber() { return eventNumber; }
        public Trex _root() { return _root; }
        public Trex.Link _parent() { return _parent; }
    }
    private ArrayList<Link> links;
    private Trex _root;
    private KaitaiStruct _parent;
    public ArrayList<Link> links() { return links; }
    public Trex _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}