// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"errors"
)

type Grande struct {
	Packages []*Grande_Package
	_io *kaitai.Stream
	_root *Grande
	_parent interface{}
}

func (this *Grande) Read(io *kaitai.Stream, parent interface{}, root *Grande) (err error) {
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
		tmp2 := new(Grande_Package)
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Packages = append(this.Packages, tmp2)
	}
	return err
}

type Grande_Package_DataTypes int
const (
	Grande_Package_DataTypes__Link1 Grande_Package_DataTypes = 3032
	Grande_Package_DataTypes__Link2 Grande_Package_DataTypes = 3033
	Grande_Package_DataTypes__Link3 Grande_Package_DataTypes = 3034
	Grande_Package_DataTypes__Link4 Grande_Package_DataTypes = 3035
)
type Grande_Package struct {
	DataType Grande_Package_DataTypes
	PackageSize uint16
	EventNumber uint32
	ErrorCount uint32
	Time *Grande_Time
	ClusterInfo *Grande_ClusterInfo
	Data []*Grande_Data
	EndOfPackage []byte
	_io *kaitai.Stream
	_root *Grande
	_parent *Grande
}

func (this *Grande_Package) Read(io *kaitai.Stream, parent *Grande, root *Grande) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DataType = Grande_Package_DataTypes(tmp3)
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PackageSize = tmp4
	tmp5, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.EventNumber = tmp5
	tmp6, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ErrorCount = tmp6
	tmp7 := new(Grande_Time)
	err = tmp7.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Time = tmp7
	tmp8 := new(Grande_ClusterInfo)
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ClusterInfo = tmp8
	this.Data = make([]*Grande_Data, 8)
	for i := range this.Data {
		tmp9 := new(Grande_Data)
		err = tmp9.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Data[i] = tmp9
	}
	this.EndOfPackage, err = this._io.ReadBytes(4)
	if err != nil {
		return err
	}
	if !bytes.Equal(this.EndOfPackage, []uint8{255, 255, 255, 255}) {
		return errors.New("Unexpected fixed contents")
	}
	return err
}
type Grande_ClusterInfo struct {
	ClusterNumber uint64
	Reserved uint64
	OpticalLineLenght uint64
	_io *kaitai.Stream
	_root *Grande
	_parent *Grande_Package
}

func (this *Grande_ClusterInfo) Read(io *kaitai.Stream, parent *Grande_Package, root *Grande) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadBitsInt(8)
	if err != nil {
		return err
	}
	this.ClusterNumber = tmp10
	tmp11, err := this._io.ReadBitsInt(8)
	if err != nil {
		return err
	}
	this.Reserved = tmp11
	tmp12, err := this._io.ReadBitsInt(16)
	if err != nil {
		return err
	}
	this.OpticalLineLenght = tmp12
	return err
}
type Grande_Data struct {
	VmeAddres uint32
	DataCount uint16
	ChannelInfo *Grande_ChannelInfo
	Data []uint16
	_io *kaitai.Stream
	_root *Grande
	_parent *Grande_Package
}

func (this *Grande_Data) Read(io *kaitai.Stream, parent *Grande_Package, root *Grande) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VmeAddres = tmp13
	tmp14, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.DataCount = tmp14
	tmp15 := new(Grande_ChannelInfo)
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ChannelInfo = tmp15
	this.Data = make([]uint16, this.DataCount)
	for i := range this.Data {
		tmp16, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.Data[i] = tmp16
	}
	return err
}
type Grande_ChannelInfo struct {
	ChannelNumber uint64
	BankNumber bool
	LinkNumber uint64
	Reserved uint64
	_io *kaitai.Stream
	_root *Grande
	_parent *Grande_Data
}

func (this *Grande_ChannelInfo) Read(io *kaitai.Stream, parent *Grande_Data, root *Grande) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadBitsInt(4)
	if err != nil {
		return err
	}
	this.ChannelNumber = tmp17
	tmp18, err := this._io.ReadBitsInt(1)
	if err != nil {
		return err
	}
	this.BankNumber = tmp18 != 0
	tmp19, err := this._io.ReadBitsInt(2)
	if err != nil {
		return err
	}
	this.LinkNumber = tmp19
	tmp20, err := this._io.ReadBitsInt(9)
	if err != nil {
		return err
	}
	this.Reserved = tmp20
	return err
}
type Grande_Time struct {
	Dat0 uint16
	Dat1 uint16
	Dat2 uint16
	Dat3 uint16
	_io *kaitai.Stream
	_root *Grande
	_parent *Grande_Package
	_f_mls bool
	mls int
	_f_dns bool
	dns int
	_f_s bool
	s int
	_f_h bool
	h int
	_f_m bool
	m int
	_f_mks bool
	mks int
}

func (this *Grande_Time) Read(io *kaitai.Stream, parent *Grande_Package, root *Grande) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Dat0 = tmp21
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Dat1 = tmp22
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Dat2 = tmp23
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Dat3 = tmp24
	return err
}
func (this *Grande_Time) Mls() (v int, err error) {
	if (this._f_mls) {
		return this.mls, nil
	}
	this.mls = int(((this.Dat1 & 2046) >> 1))
	this._f_mls = true
	return this.mls, nil
}
func (this *Grande_Time) Dns() (v int, err error) {
	if (this._f_dns) {
		return this.dns, nil
	}
	this.dns = int(((this.Dat0 & 127) * 10))
	this._f_dns = true
	return this.dns, nil
}
func (this *Grande_Time) S() (v int, err error) {
	if (this._f_s) {
		return this.s, nil
	}
	this.s = int((((this.Dat1 & 63488) >> 11) | ((this.Dat2 & 1) << 5)))
	this._f_s = true
	return this.s, nil
}
func (this *Grande_Time) H() (v int, err error) {
	if (this._f_h) {
		return this.h, nil
	}
	this.h = int(((this.Dat2 & 3968) >> 7))
	this._f_h = true
	return this.h, nil
}
func (this *Grande_Time) M() (v int, err error) {
	if (this._f_m) {
		return this.m, nil
	}
	this.m = int(((this.Dat2 & 126) >> 1))
	this._f_m = true
	return this.m, nil
}
func (this *Grande_Time) Mks() (v int, err error) {
	if (this._f_mks) {
		return this.mks, nil
	}
	this.mks = int((((this.Dat0 & 65408) >> 7) | ((this.Dat1 & 1) << 9)))
	this._f_mks = true
	return this.mks, nil
}
