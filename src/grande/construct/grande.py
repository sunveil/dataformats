from construct import *
from construct.lib import *

def grande__package__data_types(subcon):
	return Enum(subcon,
		link1=3032,
		link2=3033,
		link3=3034,
		link4=3035,
	)

grande__package = Struct(
	'data_type' / grande__package__data_types(Int16ul),
	'package_size' / Int16ul,
	'event_number' / Int32ul,
	'error_count' / Int32ul,
	'time' / LazyBound(lambda: grande__time),
	'cluster_info' / LazyBound(lambda: grande__cluster_info),
	'data' / Array(8, LazyBound(lambda: grande__data)),
	'end_of_package' / Const(b"\xFF\xFF\xFF\xFF"),
)

grande__cluster_info = Struct(
	'cluster_number' / ???,
	'reserved' / ???,
	'optical_line_lenght' / ???,
)

grande__data = Struct(
	'vme_addres' / Int32ul,
	'data_count' / Int16ul,
	'channel_info' / LazyBound(lambda: grande__channel_info),
	'data' / Array(this.data_count, Int16ul),
)

grande__channel_info = Struct(
	'channel_number' / ???,
	'bank_number' / ???,
	'link_number' / ???,
	'reserved' / ???,
)

grande__time = Struct(
	'dat0' / Int16ul,
	'dat1' / Int16ul,
	'dat2' / Int16ul,
	'dat3' / Int16ul,
	'mls' / Computed(lambda this: ((this.dat1 & 2046) >> 1)),
	'dns' / Computed(lambda this: ((this.dat0 & 127) * 10)),
	's' / Computed(lambda this: (((this.dat1 & 63488) >> 11) | ((this.dat2 & 1) << 5))),
	'h' / Computed(lambda this: ((this.dat2 & 3968) >> 7)),
	'm' / Computed(lambda this: ((this.dat2 & 126) >> 1)),
	'mks' / Computed(lambda this: (((this.dat0 & 65408) >> 7) | ((this.dat1 & 1) << 9))),
)

grande = Struct(
	'packages' / GreedyRange(LazyBound(lambda: grande__package)),
)

_schema = grande
