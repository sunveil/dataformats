// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Hiscore = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Hiscore = (function() {
  function Hiscore(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Hiscore.prototype._read = function() {
    this.packages = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packages.push(new Package(this._io, this, this._root));
      i++;
    }
  }

  var Package = Hiscore.Package = (function() {
    function Package(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Package.prototype._read = function() {
      this.hdr = new Header(this._io, this, this._root);
      this.data = new Array(9);
      for (var i = 0; i < 9; i++) {
        this.data[i] = new DataBlock(this._io, this, this._root);
      }
      this.endOfFile = this._io.ensureFixedContents([255, 255, 255, 255]);
    }

    return Package;
  })();

  var Header = Hiscore.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([192, 11]);
      this.sz = this._io.readU2le();
      this.eventNumber = this._io.readU4le();
      this.stopPosition = this._io.readU4le();
      this.time = new Time(this._io, this, this._root);
      this.ip = this._io.readU2le();
      this.stationNumber = this._io.readU2le();
    }

    return Header;
  })();

  var DataBlock = Hiscore.DataBlock = (function() {
    function DataBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    DataBlock.prototype._read = function() {
      this.offset = this._io.readU2le();
      this.len = this._io.readU2le();
      this.data = new Array(this.len);
      for (var i = 0; i < this.len; i++) {
        this.data[i] = this._io.readU2le();
      }
    }

    return DataBlock;
  })();

  var Time = Hiscore.Time = (function() {
    function Time(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Time.prototype._read = function() {
      this.dat0 = this._io.readU2le();
      this.dat1 = this._io.readU2le();
      this.dat2 = this._io.readU2le();
      this.dat3 = this._io.readU2le();
    }
    Object.defineProperty(Time.prototype, 'mls', {
      get: function() {
        if (this._m_mls !== undefined)
          return this._m_mls;
        this._m_mls = ((this.dat1 & 2046) >>> 1);
        return this._m_mls;
      }
    });
    Object.defineProperty(Time.prototype, 'dns', {
      get: function() {
        if (this._m_dns !== undefined)
          return this._m_dns;
        this._m_dns = ((this.dat0 & 127) * 10);
        return this._m_dns;
      }
    });
    Object.defineProperty(Time.prototype, 's', {
      get: function() {
        if (this._m_s !== undefined)
          return this._m_s;
        this._m_s = (((this.dat1 & 63488) >>> 11) | ((this.dat2 & 1) << 5));
        return this._m_s;
      }
    });
    Object.defineProperty(Time.prototype, 'h', {
      get: function() {
        if (this._m_h !== undefined)
          return this._m_h;
        this._m_h = ((this.dat2 & 3968) >>> 7);
        return this._m_h;
      }
    });
    Object.defineProperty(Time.prototype, 'm', {
      get: function() {
        if (this._m_m !== undefined)
          return this._m_m;
        this._m_m = ((this.dat2 & 126) >>> 1);
        return this._m_m;
      }
    });
    Object.defineProperty(Time.prototype, 'mks', {
      get: function() {
        if (this._m_mks !== undefined)
          return this._m_mks;
        this._m_mks = (((this.dat0 & 65408) >>> 7) | ((this.dat1 & 1) << 9));
        return this._m_mks;
      }
    });

    return Time;
  })();

  return Hiscore;
})();
return Hiscore;
}));
