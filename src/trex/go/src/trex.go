// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"errors"
)

type Trex struct {
	Links []*Trex_Link
	_io *kaitai.Stream
	_root *Trex
	_parent interface{}
}

func (this *Trex) Read(io *kaitai.Stream, parent interface{}, root *Trex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := new(Trex_Link)
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Links = append(this.Links, tmp2)
	}
	return err
}
type Trex_Link struct {
	Packages []*Trex_Package
	AdditionalInfo *Trex_AdditionalInfo
	_io *kaitai.Stream
	_root *Trex
	_parent *Trex
}

func (this *Trex_Link) Read(io *kaitai.Stream, parent *Trex, root *Trex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Packages = make([]*Trex_Package, 4)
	for i := range this.Packages {
		tmp3 := new(Trex_Package)
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Packages[i] = tmp3
	}
	tmp4 := new(Trex_AdditionalInfo)
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.AdditionalInfo = tmp4
	return err
}
type Trex_Package struct {
	Header *Trex_Header
	Data []uint16
	ClusterNumber uint8
	_io *kaitai.Stream
	_root *Trex
	_parent *Trex_Link
}

func (this *Trex_Package) Read(io *kaitai.Stream, parent *Trex_Link, root *Trex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5 := new(Trex_Header)
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp5
	this.Data = make([]uint16, ((this.Header.PackageSize - 9) / 2))
	for i := range this.Data {
		tmp6, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Data[i] = tmp6
	}
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ClusterNumber = tmp7
	return err
}
type Trex_Header struct {
	Magic []byte
	TransferAttribute []byte
	Status uint8
	PackageSize uint16
	RequestAddress uint8
	EventNumber uint32
	VmeAddres uint32
	_io *kaitai.Stream
	_root *Trex
	_parent interface{}
}

func (this *Trex_Header) Read(io *kaitai.Stream, parent interface{}, root *Trex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Magic, err = this._io.ReadBytes(2)
	if err != nil {
		return err
	}
	if !bytes.Equal(this.Magic, []uint8{255, 255}) {
		return errors.New("Unexpected fixed contents")
	}
	this.TransferAttribute, err = this._io.ReadBytes(1)
	if err != nil {
		return err
	}
	if !bytes.Equal(this.TransferAttribute, []uint8{160}) {
		return errors.New("Unexpected fixed contents")
	}
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Status = tmp8
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PackageSize = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RequestAddress = tmp10
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EventNumber = tmp11
	tmp12, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VmeAddres = tmp12
	return err
}
type Trex_AdditionalInfo struct {
	Header *Trex_Header
	Data []uint16
	ClusterNumber uint8
	H uint16
	M uint16
	S uint16
	Ms uint16
	OpticalLineLength uint16
	EventNumber uint32
	_io *kaitai.Stream
	_root *Trex
	_parent *Trex_Link
}

func (this *Trex_AdditionalInfo) Read(io *kaitai.Stream, parent *Trex_Link, root *Trex) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13 := new(Trex_Header)
	err = tmp13.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp13
	this.Data = make([]uint16, ((this.Header.PackageSize - 9) / 2))
	for i := range this.Data {
		tmp14, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Data[i] = tmp14
	}
	tmp15, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ClusterNumber = tmp15
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.H = tmp16
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.M = tmp17
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.S = tmp18
	tmp19, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Ms = tmp19
	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.OpticalLineLength = tmp20
	tmp21, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EventNumber = tmp21
	return err
}
