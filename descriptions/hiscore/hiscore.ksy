meta:
  id: hiscore
  file-extension: 010
  title: HiSCORE data
  license: Unlicensed
seq:
  - id: packages
    type: package
    repeat: eos
types:
  package:
    seq:
      - id: hdr
        type: header
      - id: data
        type: data_block
        repeat: expr
        repeat-expr: 9
      - id: end_of_file
        contents: [0xFF, 0xFF, 0xFF, 0xFF]
  header: 
    seq:
      - id: magic
        contents: [0xC0, 0x0B]
      - id: sz
        type: u2le	 
      - id: event_number
        type: u4le
      - id: stop_position
        type: u4le
      - id: time
        type: time
      - id: ip
        type: u2le
      - id: station_number
        type: u2le
  data_block:
    seq:
      - id: offset
        type: u2le	  
      - id: len
        type: u2le	  
      - id: data
        type: u2le 
        repeat: expr
        repeat-expr: len
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