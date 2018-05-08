// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Grande = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Grande = (function() {
  function Grande(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Grande.prototype._read = function() {
    this.packages = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.packages.push(new Package(this._io, this, this._root));
      i++;
    }
  }

  var Package = Grande.Package = (function() {
    Package.DataTypes = Object.freeze({
      LINK1: 3032,
      LINK2: 3033,
      LINK3: 3034,
      LINK4: 3035,

      3032: "LINK1",
      3033: "LINK2",
      3034: "LINK3",
      3035: "LINK4",
    });

    function Package(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Package.prototype._read = function() {
      this.dataType = this._io.readU2le();
      this.packageSize = this._io.readU2le();
      this.eventNumber = this._io.readU4le();
      this.errorCount = this._io.readU4le();
      this.time = new Time(this._io, this, this._root);
      this.clusterInfo = new ClusterInfo(this._io, this, this._root);
      this.data = new Array(8);
      for (var i = 0; i < 8; i++) {
        this.data[i] = new Data(this._io, this, this._root);
      }
      this.endOfPackage = this._io.ensureFixedContents([255, 255, 255, 255]);
    }

    return Package;
  })();

  var ClusterInfo = Grande.ClusterInfo = (function() {
    function ClusterInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ClusterInfo.prototype._read = function() {
      this.clusterNumber = this._io.readBitsInt(8);
      this.reserved = this._io.readBitsInt(8);
      this.opticalLineLenght = this._io.readBitsInt(16);
    }

    return ClusterInfo;
  })();

  var Data = Grande.Data = (function() {
    function Data(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Data.prototype._read = function() {
      this.vmeAddres = this._io.readU4le();
      this.dataCount = this._io.readU2le();
      this.channelInfo = new ChannelInfo(this._io, this, this._root);
      this.data = new Array(this.dataCount);
      for (var i = 0; i < this.dataCount; i++) {
        this.data[i] = this._io.readU2le();
      }
    }

    return Data;
  })();

  var ChannelInfo = Grande.ChannelInfo = (function() {
    function ChannelInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ChannelInfo.prototype._read = function() {
      this.channelNumber = this._io.readBitsInt(4);
      this.bankNumber = this._io.readBitsInt(1) != 0;
      this.linkNumber = this._io.readBitsInt(2);
      this.reserved = this._io.readBitsInt(9);
    }

    return ChannelInfo;
  })();

  var Time = Grande.Time = (function() {
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

  return Grande;
})();
return Grande;
}));
