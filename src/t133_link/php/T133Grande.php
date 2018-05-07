<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class T133Grande extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \T133Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_link = new \T133Grande\Link($this->_io, $this, $this->_root);
    }
    protected $_m_link;
    public function link() { return $this->_m_link; }
}

namespace \T133Grande;

class Link extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \T133Grande $_parent = null, \T133Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packages = [];
        $n = 32;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_packages[] = new \T133Grande\Package($this->_io, $this, $this->_root);
        }
        $this->_m_additionalInfo = new \T133Grande\AdditionalInfo($this->_io, $this, $this->_root);
    }
    protected $_m_packages;
    protected $_m_additionalInfo;
    public function packages() { return $this->_m_packages; }
    public function additionalInfo() { return $this->_m_additionalInfo; }
}

namespace \T133Grande;

class Package extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \T133Grande\Link $_parent = null, \T133Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_h = $this->_io->readU2le();
        $this->_m_m = $this->_io->readU2le();
        $this->_m_s = $this->_io->readU2le();
        $this->_m_ms = $this->_io->readU2le();
        $this->_m_opticalLineLength = $this->_io->readU2le();
        $this->_m_eventNumber = $this->_io->readU4le();
    }
    protected $_m_h;
    protected $_m_m;
    protected $_m_s;
    protected $_m_ms;
    protected $_m_opticalLineLength;
    protected $_m_eventNumber;
    public function h() { return $this->_m_h; }
    public function m() { return $this->_m_m; }
    public function s() { return $this->_m_s; }
    public function ms() { return $this->_m_ms; }
    public function opticalLineLength() { return $this->_m_opticalLineLength; }
    public function eventNumber() { return $this->_m_eventNumber; }
}

namespace \T133Grande;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \T133Grande\AdditionalInfo $_parent = null, \T133Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xFF\xFF");
        $this->_m_transferAttribute = $this->_io->ensureFixedContents("\xA0");
        $this->_m_status = $this->_io->readU1();
        $this->_m_packageSize = $this->_io->readU2le();
        $this->_m_requestAddress = $this->_io->readU1();
        $this->_m_eventNumber = $this->_io->readU4le();
        $this->_m_vmeAddres = $this->_io->readU4le();
    }
    protected $_m_magic;
    protected $_m_transferAttribute;
    protected $_m_status;
    protected $_m_packageSize;
    protected $_m_requestAddress;
    protected $_m_eventNumber;
    protected $_m_vmeAddres;
    public function magic() { return $this->_m_magic; }
    public function transferAttribute() { return $this->_m_transferAttribute; }
    public function status() { return $this->_m_status; }
    public function packageSize() { return $this->_m_packageSize; }
    public function requestAddress() { return $this->_m_requestAddress; }
    public function eventNumber() { return $this->_m_eventNumber; }
    public function vmeAddres() { return $this->_m_vmeAddres; }
}

namespace \T133Grande;

class AdditionalInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \T133Grande\Link $_parent = null, \T133Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \T133Grande\Header($this->_io, $this, $this->_root);
        $this->_m_data = [];
        $n = intval(($this->header()->packageSize() - 9) / 2);
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = $this->_io->readU2le();
        }
        $this->_m_clusterNumber = $this->_io->readU1();
        $this->_m_h = $this->_io->readU2le();
        $this->_m_m = $this->_io->readU2le();
        $this->_m_s = $this->_io->readU2le();
        $this->_m_ms = $this->_io->readU2le();
        $this->_m_opticalLineLength = $this->_io->readU2le();
        $this->_m_eventNumber = $this->_io->readU4le();
    }
    protected $_m_header;
    protected $_m_data;
    protected $_m_clusterNumber;
    protected $_m_h;
    protected $_m_m;
    protected $_m_s;
    protected $_m_ms;
    protected $_m_opticalLineLength;
    protected $_m_eventNumber;
    public function header() { return $this->_m_header; }
    public function data() { return $this->_m_data; }
    public function clusterNumber() { return $this->_m_clusterNumber; }
    public function h() { return $this->_m_h; }
    public function m() { return $this->_m_m; }
    public function s() { return $this->_m_s; }
    public function ms() { return $this->_m_ms; }
    public function opticalLineLength() { return $this->_m_opticalLineLength; }
    public function eventNumber() { return $this->_m_eventNumber; }
}
