// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Trex = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
var Trex = (function() {
  function Trex(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Trex.prototype._read = function() {
    this.links = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.links.push(new Link(this._io, this, this._root));
      i++;
    }
  }

  var Link = Trex.Link = (function() {
    function Link(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Link.prototype._read = function() {
      this.packages = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.packages[i] = new Package(this._io, this, this._root);
      }
      this.additionalInfo = new AdditionalInfo(this._io, this, this._root);
    }

    return Link;
  })();

  var Package = Trex.Package = (function() {
    function Package(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Package.prototype._read = function() {
      this.header = new Header(this._io, this, this._root);
      this.data = new Array(Math.floor((this.header.packageSize - 9) / 2));
      for (var i = 0; i < Math.floor((this.header.packageSize - 9) / 2); i++) {
        this.data[i] = this._io.readU2le();
      }
      this.clusterNumber = this._io.readU1();
    }

    return Package;
  })();

  var Header = Trex.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([255, 255]);
      this.transferAttribute = this._io.ensureFixedContents([160]);
      this.status = this._io.readU1();
      this.packageSize = this._io.readU2le();
      this.requestAddress = this._io.readU1();
      this.eventNumber = this._io.readU4le();
      this.vmeAddres = this._io.readU4le();
    }

    return Header;
  })();

  var AdditionalInfo = Trex.AdditionalInfo = (function() {
    function AdditionalInfo(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    AdditionalInfo.prototype._read = function() {
      this.header = new Header(this._io, this, this._root);
      this.data = new Array(Math.floor((this.header.packageSize - 9) / 2));
      for (var i = 0; i < Math.floor((this.header.packageSize - 9) / 2); i++) {
        this.data[i] = this._io.readU2le();
      }
      this.clusterNumber = this._io.readU1();
      this.h = this._io.readU2le();
      this.m = this._io.readU2le();
      this.s = this._io.readU2le();
      this.ms = this._io.readU2le();
      this.opticalLineLength = this._io.readU2le();
      this.eventNumber = this._io.readU4le();
    }

    return AdditionalInfo;
  })();

  return Trex;
})();
return Trex;
}));
