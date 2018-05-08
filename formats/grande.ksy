meta:
  id: grande
seq:
  - id: packages
    type: package
    repeat: eos
types:
  package:
    seq:
      - id: data_type
        type: u2le
        enum: data_types
      - id: package_size
        type: u2le
      - id: event_number
        type: u4le
      - id: error_count
        type: u4le
      - id: time
        type: time
      - id: cluster_info
        type: cluster_info
      - id: data
        type: data
        repeat: expr
        repeat-expr: 8
      - id: end_of_package
        contents: [0xFF, 0xFF, 0xFF, 0xFF]
    enums:
      data_types:
        3032: link1 
        3033: link2 
        3034: link3   
        3035: link4 
  data:
    seq:
      - id: vme_addres
        type: u4le
      - id: data_count
        type: u2le
      - id: channel_info
        type: channel_info
      - id: data
        type: u2le
        repeat: expr
        repeat-expr: data_count
  cluster_info:
    seq:
      - id: cluster_number
        type: b8
      - id: reserved
        type: b8
      - id: optical_line_lenght
        type: b16
  channel_info:
    seq:
      - id: channel_number
        type: b4
      - id: bank_number
        type: b1
      - id: link_number
        type: b2
      - id: reserved
        type: b9
  time:
    seq:
      - id: dat0
        type: u2le
      - id: dat1
        type: u2le
      - id: dat2
        type: u2le
      - id: dat3
        type: u2le
    instances:
      dns:
        value: '(dat0 & 0x7f) * 10'
      mks:
        value: '((dat0 & 0xff80) >> 7) | (dat1 & 1) << 9'
      mls: 
        value: '(dat1 & 0x7fe) >> 1'
      s:
        value: '((dat1 & 0xf800) >> 11) | ((dat2 & 1) << 5)' 
      m:
        value: '(dat2 & 0x7e) >> 1'
      h: 
        value: '(dat2 & 0xf80) >> 7'