# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Grande;

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
        push @{$self->{packages}}, Grande::Package->new($self->{_io}, $self, $self->{_root});
    }
}

sub packages {
    my ($self) = @_;
    return $self->{packages};
}

########################################################################
package Grande::Package;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DATA_TYPES_LINK1 = 3032;
our $DATA_TYPES_LINK2 = 3033;
our $DATA_TYPES_LINK3 = 3034;
our $DATA_TYPES_LINK4 = 3035;

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

    $self->{data_type} = $self->{_io}->read_u2le();
    $self->{package_size} = $self->{_io}->read_u2le();
    $self->{event_number} = $self->{_io}->read_u4le();
    $self->{error_count} = $self->{_io}->read_u4le();
    $self->{time} = Grande::Time->new($self->{_io}, $self, $self->{_root});
    $self->{cluster_info} = Grande::ClusterInfo->new($self->{_io}, $self, $self->{_root});
    $self->{data} = ();
    my $n_data = 8;
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = Grande::Data->new($self->{_io}, $self, $self->{_root});
    }
    $self->{end_of_package} = $self->{_io}->ensure_fixed_contents(pack('C*', (255, 255, 255, 255)));
}

sub data_type {
    my ($self) = @_;
    return $self->{data_type};
}

sub package_size {
    my ($self) = @_;
    return $self->{package_size};
}

sub event_number {
    my ($self) = @_;
    return $self->{event_number};
}

sub error_count {
    my ($self) = @_;
    return $self->{error_count};
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub cluster_info {
    my ($self) = @_;
    return $self->{cluster_info};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub end_of_package {
    my ($self) = @_;
    return $self->{end_of_package};
}

########################################################################
package Grande::ClusterInfo;

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

    $self->{cluster_number} = $self->{_io}->read_bits_int(8);
    $self->{reserved} = $self->{_io}->read_bits_int(8);
    $self->{optical_line_lenght} = $self->{_io}->read_bits_int(16);
}

sub cluster_number {
    my ($self) = @_;
    return $self->{cluster_number};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub optical_line_lenght {
    my ($self) = @_;
    return $self->{optical_line_lenght};
}

########################################################################
package Grande::Data;

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

    $self->{vme_addres} = $self->{_io}->read_u4le();
    $self->{data_count} = $self->{_io}->read_u2le();
    $self->{channel_info} = Grande::ChannelInfo->new($self->{_io}, $self, $self->{_root});
    $self->{data} = ();
    my $n_data = $self->data_count();
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = $self->{_io}->read_u2le();
    }
}

sub vme_addres {
    my ($self) = @_;
    return $self->{vme_addres};
}

sub data_count {
    my ($self) = @_;
    return $self->{data_count};
}

sub channel_info {
    my ($self) = @_;
    return $self->{channel_info};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Grande::ChannelInfo;

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

    $self->{channel_number} = $self->{_io}->read_bits_int(4);
    $self->{bank_number} = $self->{_io}->read_bits_int(1);
    $self->{link_number} = $self->{_io}->read_bits_int(2);
    $self->{reserved} = $self->{_io}->read_bits_int(9);
}

sub channel_number {
    my ($self) = @_;
    return $self->{channel_number};
}

sub bank_number {
    my ($self) = @_;
    return $self->{bank_number};
}

sub link_number {
    my ($self) = @_;
    return $self->{link_number};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Grande::Time;

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
