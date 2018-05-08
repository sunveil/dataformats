from construct import *
from construct.lib import *

trex__link = Struct(
	'packages' / Array(4, LazyBound(lambda: trex__package)),
	'additional_info' / LazyBound(lambda: trex__additional_info),
)

trex__package = Struct(
	'header' / LazyBound(lambda: trex__header),
	'data' / Array((this.header.package_size - 9) // 2, Int16ul),
	'cluster_number' / Int8ub,
)

trex__header = Struct(
	'magic' / Const(b"\xFF\xFF"),
	'transfer_attribute' / Const(b"\xA0"),
	'status' / Int8ub,
	'package_size' / Int16ul,
	'request_address' / Int8ub,
	'event_number' / Int32ul,
	'vme_addres' / Int32ul,
)

trex__additional_info = Struct(
	'header' / LazyBound(lambda: trex__header),
	'data' / Array((this.header.package_size - 9) // 2, Int16ul),
	'cluster_number' / Int8ub,
	'h' / Int16ul,
	'm' / Int16ul,
	's' / Int16ul,
	'ms' / Int16ul,
	'optical_line_length' / Int16ul,
	'event_number' / Int32ul,
)

trex = Struct(
	'links' / GreedyRange(LazyBound(lambda: trex__link)),
)

_schema = trex
