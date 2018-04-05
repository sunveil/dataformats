# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Hiscore;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{packages} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{packages}}, Hiscore::Package->new($self->{_io}, $self, $self->{_root});
    }
}

sub packages {
    my ($self) = @_;
    return $self->{packages};
}

########################################################################
package Hiscore::Package;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{hdr} = Hiscore::Header->new($self->{_io}, $self, $self->{_root});
    $self->{data} = ();
    my $n_data = 9;
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = Hiscore::DataBlock->new($self->{_io}, $self, $self->{_root});
    }
    $self->{end_of_file} = $self->{_io}->ensure_fixed_contents(pack('C*', (255, 255, 255, 255)));
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub end_of_file {
    my ($self) = @_;
    return $self->{end_of_file};
}

########################################################################
package Hiscore::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (192, 11)));
    $self->{sz} = $self->{_io}->read_u2le();
    $self->{event_number} = $self->{_io}->read_u4le();
    $self->{stop_position} = $self->{_io}->read_u4le();
    $self->{time} = Hiscore::Time->new($self->{_io}, $self, $self->{_root});
    $self->{ip} = $self->{_io}->read_u2le();
    $self->{station_number} = $self->{_io}->read_u2le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub sz {
    my ($self) = @_;
    return $self->{sz};
}

sub event_number {
    my ($self) = @_;
    return $self->{event_number};
}

sub stop_position {
    my ($self) = @_;
    return $self->{stop_position};
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub ip {
    my ($self) = @_;
    return $self->{ip};
}

sub station_number {
    my ($self) = @_;
    return $self->{station_number};
}

########################################################################
package Hiscore::DataBlock;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset} = $self->{_io}->read_u2le();
    $self->{len} = $self->{_io}->read_u2le();
    $self->{data} = ();
    my $n_data = $self->len();
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = $self->{_io}->read_u2le();
    }
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Hiscore::Time;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{dat0} = $self->{_io}->read_u2le();
    $self->{dat1} = $self->{_io}->read_u2le();
    $self->{dat2} = $self->{_io}->read_u2le();
    $self->{dat3} = $self->{_io}->read_u2le();
}

sub mls {
    my ($self) = @_;
    return $self->{mls} if ($self->{mls});
    $self->{mls} = (($self->dat1() & 2046) >> 1);
    return $self->{mls};
}

sub dns {
    my ($self) = @_;
    return $self->{dns} if ($self->{dns});
    $self->{dns} = (($self->dat0() & 127) * 10);
    return $self->{dns};
}

sub s {
    my ($self) = @_;
    return $self->{s} if ($self->{s});
    $self->{s} = ((($self->dat1() & 63488) >> 11) | (($self->dat2() & 1) << 5));
    return $self->{s};
}

sub h {
    my ($self) = @_;
    return $self->{h} if ($self->{h});
    $self->{h} = (($self->dat2() & 3968) >> 7);
    return $self->{h};
}

sub m {
    my ($self) = @_;
    return $self->{m} if ($self->{m});
    $self->{m} = (($self->dat2() & 126) >> 1);
    return $self->{m};
}

sub mks {
    my ($self) = @_;
    return $self->{mks} if ($self->{mks});
    $self->{mks} = ((($self->dat0() & 65408) >> 7) | (($self->dat1() & 1) << 9));
    return $self->{mks};
}

sub dat0 {
    my ($self) = @_;
    return $self->{dat0};
}

sub dat1 {
    my ($self) = @_;
    return $self->{dat1};
}

sub dat2 {
    my ($self) = @_;
    return $self->{dat2};
}

sub dat3 {
    my ($self) = @_;
    return $self->{dat3};
}

1;
