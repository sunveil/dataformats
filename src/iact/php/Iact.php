<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Iact extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packages = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_packages[] = new \Iact\Package($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_packages;
    public function packages() { return $this->_m_packages; }
}

namespace \Iact;

class Package extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Iact\Header($this->_io, $this, $this->_root);
        $this->_m_data = new \Iact\Data($this->_io, $this, $this->_root);
        $this->_m_endOfFile = $this->_io->ensureFixedContents("\xFF\xFF\xFF\xFF");
    }
    protected $_m_header;
    protected $_m_data;
    protected $_m_endOfFile;
    public function header() { return $this->_m_header; }
    public function data() { return $this->_m_data; }
    public function endOfFile() { return $this->_m_endOfFile; }
}

namespace \Iact;

class Data extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact\Package $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chanels = [];
        $n = 32;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_chanels[] = new \Iact\Chanel($this->_io, $this, $this->_root);
        }
    }
    protected $_m_chanels;
    public function chanels() { return $this->_m_chanels; }
}

namespace \Iact;

class Chanel extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact\Data $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_big = $this->_io->readU2le();
        $this->_m_small = $this->_io->readU2le();
    }
    protected $_m_big;
    protected $_m_small;
    public function big() { return $this->_m_big; }
    public function small() { return $this->_m_small; }
}

namespace \Iact;

class MarocStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact\Header $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_marocNuber = $this->_io->readBitsInt(5);
        $this->_m_skip = $this->_io->readBitsInt(27);
    }
    protected $_m_marocNuber;
    protected $_m_skip;
    public function marocNuber() { return $this->_m_marocNuber; }
    public function skip() { return $this->_m_skip; }
}

namespace \Iact;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact\Package $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xD8\x0B");
        $this->_m_size = $this->_io->readU2le();
        $this->_m_eventNumber = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readU4le();
        $this->_m_time = new \Iact\Time($this->_io, $this, $this->_root);
        $this->_m_marocStruct = new \Iact\MarocStruct($this->_io, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_size;
    protected $_m_eventNumber;
    protected $_m_reserved;
    protected $_m_time;
    protected $_m_marocStruct;
    public function magic() { return $this->_m_magic; }
    public function size() { return $this->_m_size; }
    public function eventNumber() { return $this->_m_eventNumber; }
    public function reserved() { return $this->_m_reserved; }
    public function time() { return $this->_m_time; }
    public function marocStruct() { return $this->_m_marocStruct; }
}

namespace \Iact;

class Time extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Iact\Header $_parent = null, \Iact $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dat0 = $this->_io->readU2le();
        $this->_m_dat1 = $this->_io->readU2le();
        $this->_m_dat2 = $this->_io->readU2le();
        $this->_m_dat3 = $this->_io->readU2le();
    }
    protected $_m_mls;
    public function mls() {
        if ($this->_m_mls !== null)
            return $this->_m_mls;
        $this->_m_mls = (($this->dat1() & 2046) >> 1);
        return $this->_m_mls;
    }
    protected $_m_dns;
    public function dns() {
        if ($this->_m_dns !== null)
            return $this->_m_dns;
        $this->_m_dns = (($this->dat0() & 127) * 10);
        return $this->_m_dns;
    }
    protected $_m_s;
    public function s() {
        if ($this->_m_s !== null)
            return $this->_m_s;
        $this->_m_s = ((($this->dat1() & 63488) >> 11) | (($this->dat2() & 1) << 5));
        return $this->_m_s;
    }
    protected $_m_h;
    public function h() {
        if ($this->_m_h !== null)
            return $this->_m_h;
        $this->_m_h = (($this->dat2() & 3968) >> 7);
        return $this->_m_h;
    }
    protected $_m_m;
    public function m() {
        if ($this->_m_m !== null)
            return $this->_m_m;
        $this->_m_m = (($this->dat2() & 126) >> 1);
        return $this->_m_m;
    }
    protected $_m_mks;
    public function mks() {
        if ($this->_m_mks !== null)
            return $this->_m_mks;
        $this->_m_mks = ((($this->dat0() & 65408) >> 7) | (($this->dat1() & 1) << 9));
        return $this->_m_mks;
    }
    protected $_m_dat0;
    protected $_m_dat1;
    protected $_m_dat2;
    protected $_m_dat3;
    public function dat0() { return $this->_m_dat0; }
    public function dat1() { return $this->_m_dat1; }
    public function dat2() { return $this->_m_dat2; }
    public function dat3() { return $this->_m_dat3; }
}
