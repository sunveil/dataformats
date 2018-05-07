meta:
  id: trex
seq:
  - id: links
    type: link
    repeat: eos
types:
  link:
    seq:
      - id: packages
        type: package
        repeat: expr
        repeat-expr: 4
      - id: additional_info
        type: additional_info      
  package:
    seq:
      - id: header
        type: header
      - id: data
        type: u2le
        repeat: expr
        repeat-expr: (header.package_size - 9) / 2
      - id: cluster_number
        type: u1
    seq:
      - id: h
        type: u2le
      - id: m
        type: u2le
      - id: s
        type: u2le
      - id: ms
        type: u2le
      - id: optical_line_length
        type: u2le
      - id: event_number
        type: u4le
  header:
    seq:
      - id: magic
        contents: [0xFF, 0xFF]
      - id: transfer_attribute
        contents: [0xA0]
      - id: status
        type: u1
      - id: package_size
        type: u2le
      - id: request_address
        type: u1
      - id: event_number
        type: u4le
      - id: vme_addres
        type: u4le
  additional_info:
    seq:
      - id: header
        type: header
      - id: data
        type: u2le
        repeat: expr
        repeat-expr: (header.package_size - 9) / 2
      - id: cluster_number
        type: u1 
      - id: h
        type: u2le
      - id: m
        type: u2le
      - id: s
        type: u2le
      - id: ms
        type: u2le
      - id: optical_line_length
        type: u2le
      - id: event_number
        type: u4le