meta:
  id: iact
  title: IACT data
seq:
  - id: packages
    type: package
    repeat: eos
types:
  package:
    seq:
      - id: header
        type: header
      - id: data
        type: data
      - id: end_of_package
        contents: [0xFF, 0xFF, 0xFF, 0xFF]
  header: 
    seq:
      - id: magic
        contents: [0xD8, 0x0B]
        size: u2le
      - id: size
        type: u2le	 
      - id: event_number
        type: u4le
      - id: reserved
        type: u4le
      - id: time
        type: time
      - id: maroc_struct
        type: maroc_struct
  data:
    seq:
      - id: chanels
        type: chanel
        repeat: expr
        repeat-expr: 32
  chanel:
    seq:
      - id: big
        type: u2le
      - id: small
        type: u2le
  maroc_struct:
    seq:
      - id: maroc_nuber
        type: b5
      - id: skip
        type: b27
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