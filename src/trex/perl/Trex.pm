# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Trex;

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

    $self->{links} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{links}}, Trex::Link->new($self->{_io}, $self, $self->{_root});
    }
}

sub links {
    my ($self) = @_;
    return $self->{links};
}

########################################################################
package Trex::Link;

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
    my $n_packages = 4;
    for (my $i = 0; $i < $n_packages; $i++) {
        $self->{packages}[$i] = Trex::Package->new($self->{_io}, $self, $self->{_root});
    }
    $self->{additional_info} = Trex::AdditionalInfo->new($self->{_io}, $self, $self->{_root});
}

sub packages {
    my ($self) = @_;
    return $self->{packages};
}

sub additional_info {
    my ($self) = @_;
    return $self->{additional_info};
}

########################################################################
package Trex::Package;

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

    $self->{h} = $self->{_io}->read_u2le();
    $self->{m} = $self->{_io}->read_u2le();
    $self->{s} = $self->{_io}->read_u2le();
    $self->{ms} = $self->{_io}->read_u2le();
    $self->{optical_line_length} = $self->{_io}->read_u2le();
    $self->{event_number} = $self->{_io}->read_u4le();
}

sub h {
    my ($self) = @_;
    return $self->{h};
}

sub m {
    my ($self) = @_;
    return $self->{m};
}

sub s {
    my ($self) = @_;
    return $self->{s};
}

sub ms {
    my ($self) = @_;
    return $self->{ms};
}

sub optical_line_length {
    my ($self) = @_;
    return $self->{optical_line_length};
}

sub event_number {
    my ($self) = @_;
    return $self->{event_number};
}

########################################################################
package Trex::Header;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (255, 255)));
    $self->{transfer_attribute} = $self->{_io}->ensure_fixed_contents(pack('C*', (160)));
    $self->{status} = $self->{_io}->read_u1();
    $self->{package_size} = $self->{_io}->read_u2le();
    $self->{request_address} = $self->{_io}->read_u1();
    $self->{event_number} = $self->{_io}->read_u4le();
    $self->{vme_addres} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub transfer_attribute {
    my ($self) = @_;
    return $self->{transfer_attribute};
}

sub status {
    my ($self) = @_;
    return $self->{status};
}

sub package_size {
    my ($self) = @_;
    return $self->{package_size};
}

sub request_address {
    my ($self) = @_;
    return $self->{request_address};
}

sub event_number {
    my ($self) = @_;
    return $self->{event_number};
}

sub vme_addres {
    my ($self) = @_;
    return $self->{vme_addres};
}

########################################################################
package Trex::AdditionalInfo;

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

    $self->{header} = Trex::Header->new($self->{_io}, $self, $self->{_root});
    $self->{data} = ();
    my $n_data = int(($self->header()->package_size() - 9) / 2);
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = $self->{_io}->read_u2le();
    }
    $self->{cluster_number} = $self->{_io}->read_u1();
    $self->{h} = $self->{_io}->read_u2le();
    $self->{m} = $self->{_io}->read_u2le();
    $self->{s} = $self->{_io}->read_u2le();
    $self->{ms} = $self->{_io}->read_u2le();
    $self->{optical_line_length} = $self->{_io}->read_u2le();
    $self->{event_number} = $self->{_io}->read_u4le();
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub cluster_number {
    my ($self) = @_;
    return $self->{cluster_number};
}

sub h {
    my ($self) = @_;
    return $self->{h};
}

sub m {
    my ($self) = @_;
    return $self->{m};
}

sub s {
    my ($self) = @_;
    return $self->{s};
}

sub ms {
    my ($self) = @_;
    return $self->{ms};
}

sub optical_line_length {
    my ($self) = @_;
    return $self->{optical_line_length};
}

sub event_number {
    my ($self) = @_;
    return $self->{event_number};
}

1;
