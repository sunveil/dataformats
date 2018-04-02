<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Hiscore extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Hiscore $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packages = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_packages[] = new \Hiscore\Package($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_packages;
    public function packages() { return $this->_m_packages; }
}

namespace \Hiscore;

class Package extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hiscore $_parent = null, \Hiscore $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hdr = new \Hiscore\Header($this->_io, $this, $this->_root);
        $this->_m_data = [];
        $n = 9;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = new \Hiscore\DataBlock($this->_io, $this, $this->_root);
        }
        $this->_m_endOfFile = $this->_io->ensureFixedContents("\xFF\xFF\xFF\xFF");
    }
    protected $_m_hdr;
    protected $_m_data;
    protected $_m_endOfFile;
    public function hdr() { return $this->_m_hdr; }
    public function data() { return $this->_m_data; }
    public function endOfFile() { return $this->_m_endOfFile; }
}

namespace \Hiscore;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hiscore\Package $_parent = null, \Hiscore $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\xC0\x0B");
        $this->_m_sz = $this->_io->readU2le();
        $this->_m_eventNumber = $this->_io->readU4le();
        $this->_m_stopPosition = $this->_io->readU4le();
        $this->_m_time = new \Hiscore\Time($this->_io, $this, $this->_root);
        $this->_m_ip = $this->_io->readU2le();
        $this->_m_stationNumber = $this->_io->readU2le();
    }
    protected $_m_magic;
    protected $_m_sz;
    protected $_m_eventNumber;
    protected $_m_stopPosition;
    protected $_m_time;
    protected $_m_ip;
    protected $_m_stationNumber;
    public function magic() { return $this->_m_magic; }
    public function sz() { return $this->_m_sz; }
    public function eventNumber() { return $this->_m_eventNumber; }
    public function stopPosition() { return $this->_m_stopPosition; }
    public function time() { return $this->_m_time; }
    public function ip() { return $this->_m_ip; }
    public function stationNumber() { return $this->_m_stationNumber; }
}

namespace \Hiscore;

class DataBlock extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hiscore\Package $_parent = null, \Hiscore $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_offset = $this->_io->readU2le();
        $this->_m_len = $this->_io->readU2le();
        $this->_m_data = [];
        $n = $this->len();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = $this->_io->readU2le();
        }
    }
    protected $_m_offset;
    protected $_m_len;
    protected $_m_data;
    public function offset() { return $this->_m_offset; }
    public function len() { return $this->_m_len; }
    public function data() { return $this->_m_data; }
}

namespace \Hiscore;

class Time extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hiscore\Header $_parent = null, \Hiscore $_root = null) {
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
