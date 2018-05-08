<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Grande extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packages = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_packages[] = new \Grande\Package($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_packages;
    public function packages() { return $this->_m_packages; }
}

namespace \Grande;

class Package extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Grande $_parent = null, \Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dataType = $this->_io->readU2le();
        $this->_m_packageSize = $this->_io->readU2le();
        $this->_m_eventNumber = $this->_io->readU4le();
        $this->_m_errorCount = $this->_io->readU4le();
        $this->_m_time = new \Grande\Time($this->_io, $this, $this->_root);
        $this->_m_clusterInfo = new \Grande\ClusterInfo($this->_io, $this, $this->_root);
        $this->_m_data = [];
        $n = 8;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = new \Grande\Data($this->_io, $this, $this->_root);
        }
        $this->_m_endOfPackage = $this->_io->ensureFixedContents("\xFF\xFF\xFF\xFF");
    }
    protected $_m_dataType;
    protected $_m_packageSize;
    protected $_m_eventNumber;
    protected $_m_errorCount;
    protected $_m_time;
    protected $_m_clusterInfo;
    protected $_m_data;
    protected $_m_endOfPackage;
    public function dataType() { return $this->_m_dataType; }
    public function packageSize() { return $this->_m_packageSize; }
    public function eventNumber() { return $this->_m_eventNumber; }
    public function errorCount() { return $this->_m_errorCount; }
    public function time() { return $this->_m_time; }
    public function clusterInfo() { return $this->_m_clusterInfo; }
    public function data() { return $this->_m_data; }
    public function endOfPackage() { return $this->_m_endOfPackage; }
}

namespace \Grande\Package;

class DataTypes {
    const LINK1 = 3032;
    const LINK2 = 3033;
    const LINK3 = 3034;
    const LINK4 = 3035;
}

namespace \Grande;

class ClusterInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Grande\Package $_parent = null, \Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_clusterNumber = $this->_io->readBitsInt(8);
        $this->_m_reserved = $this->_io->readBitsInt(8);
        $this->_m_opticalLineLenght = $this->_io->readBitsInt(16);
    }
    protected $_m_clusterNumber;
    protected $_m_reserved;
    protected $_m_opticalLineLenght;
    public function clusterNumber() { return $this->_m_clusterNumber; }
    public function reserved() { return $this->_m_reserved; }
    public function opticalLineLenght() { return $this->_m_opticalLineLenght; }
}

namespace \Grande;

class Data extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Grande\Package $_parent = null, \Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_vmeAddres = $this->_io->readU4le();
        $this->_m_dataCount = $this->_io->readU2le();
        $this->_m_channelInfo = new \Grande\ChannelInfo($this->_io, $this, $this->_root);
        $this->_m_data = [];
        $n = $this->dataCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_data[] = $this->_io->readU2le();
        }
    }
    protected $_m_vmeAddres;
    protected $_m_dataCount;
    protected $_m_channelInfo;
    protected $_m_data;
    public function vmeAddres() { return $this->_m_vmeAddres; }
    public function dataCount() { return $this->_m_dataCount; }
    public function channelInfo() { return $this->_m_channelInfo; }
    public function data() { return $this->_m_data; }
}

namespace \Grande;

class ChannelInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Grande\Data $_parent = null, \Grande $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_channelNumber = $this->_io->readBitsInt(4);
        $this->_m_bankNumber = $this->_io->readBitsInt(1) != 0;
        $this->_m_linkNumber = $this->_io->readBitsInt(2);
        $this->_m_reserved = $this->_io->readBitsInt(9);
    }
    protected $_m_channelNumber;
    protected $_m_bankNumber;
    protected $_m_linkNumber;
    protected $_m_reserved;
    public function channelNumber() { return $this->_m_channelNumber; }
    public function bankNumber() { return $this->_m_bankNumber; }
    public function linkNumber() { return $this->_m_linkNumber; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \Grande;

class Time extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Grande\Package $_parent = null, \Grande $_root = null) {
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
