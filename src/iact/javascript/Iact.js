// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Iact = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Iact = (function() {
  function Iact(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Iact.prototype._read = function() {
    this.packages = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packages.push(new Package(this._io, this, this._root));
      i++;
    }
  }

  var Package = Iact.Package = (function() {
    function Package(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Package.prototype._read = function() {
      this.header = new Header(this._io, this, this._root);
      this.data = new Data(this._io, this, this._root);
      this.endOfFile = this._io.ensureFixedContents([255, 255, 255, 255]);
    }

    return Package;
  })();

  var Data = Iact.Data = (function() {
    function Data(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Data.prototype._read = function() {
      this.chanels = new Array(32);
      for (var i = 0; i < 32; i++) {
        this.chanels[i] = new Chanel(this._io, this, this._root);
      }
    }

    return Data;
  })();

  var Chanel = Iact.Chanel = (function() {
    function Chanel(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chanel.prototype._read = function() {
      this.big = this._io.readU2le();
      this.small = this._io.readU2le();
    }

    return Chanel;
  })();

  var MarocStruct = Iact.MarocStruct = (function() {
    function MarocStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MarocStruct.prototype._read = function() {
      this.marocNuber = this._io.readBitsInt(5);
      this.skip = this._io.readBitsInt(27);
    }

    return MarocStruct;
  })();

  var Header = Iact.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([216, 11]);
      this.size = this._io.readU2le();
      this.eventNumber = this._io.readU4le();
      this.reserved = this._io.readU4le();
      this.time = new Time(this._io, this, this._root);
      this.marocStruct = new MarocStruct(this._io, this, this._root);
    }

    return Header;
  })();

  var Time = Iact.Time = (function() {
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

  return Iact;
})();
return Iact;
}));
