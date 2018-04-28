// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "iact.h"



iact_t::iact_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void iact_t::_read() {
    m_packages = new std::vector<package_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packages->push_back(new package_t(m__io, this, m__root));
            i++;
        }
    }
}

iact_t::~iact_t() {
    for (std::vector<package_t*>::iterator it = m_packages->begin(); it != m_packages->end(); ++it) {
        delete *it;
    }
    delete m_packages;
}

iact_t::package_t::package_t(kaitai::kstream* p__io, iact_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iact_t::package_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_data = new data_t(m__io, this, m__root);
    m_end_of_file = m__io->ensure_fixed_contents(std::string("\xFF\xFF\xFF\xFF", 4));
}

iact_t::package_t::~package_t() {
    delete m_header;
    delete m_data;
}

iact_t::data_t::data_t(kaitai::kstream* p__io, iact_t::package_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iact_t::data_t::_read() {
    int l_chanels = 32;
    m_chanels = new std::vector<chanel_t*>();
    m_chanels->reserve(l_chanels);
    for (int i = 0; i < l_chanels; i++) {
        m_chanels->push_back(new chanel_t(m__io, this, m__root));
    }
}

iact_t::data_t::~data_t() {
    for (std::vector<chanel_t*>::iterator it = m_chanels->begin(); it != m_chanels->end(); ++it) {
        delete *it;
    }
    delete m_chanels;
}

iact_t::chanel_t::chanel_t(kaitai::kstream* p__io, iact_t::data_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iact_t::chanel_t::_read() {
    m_big = m__io->read_u2le();
    m_small = m__io->read_u2le();
}

iact_t::chanel_t::~chanel_t() {
}

iact_t::maroc_struct_t::maroc_struct_t(kaitai::kstream* p__io, iact_t::header_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iact_t::maroc_struct_t::_read() {
    m_maroc_nuber = m__io->read_bits_int(5);
    m_skip = m__io->read_bits_int(27);
}

iact_t::maroc_struct_t::~maroc_struct_t() {
}

iact_t::header_t::header_t(kaitai::kstream* p__io, iact_t::package_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void iact_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xD8\x0B", 2));
    m_size = m__io->read_u2le();
    m_event_number = m__io->read_u4le();
    m_reserved = m__io->read_u4le();
    m_time = new time_t(m__io, this, m__root);
    m_maroc_struct = new maroc_struct_t(m__io, this, m__root);
}

iact_t::header_t::~header_t() {
    delete m_time;
    delete m_maroc_struct;
}

iact_t::time_t::time_t(kaitai::kstream* p__io, iact_t::header_t* p__parent, iact_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_mls = false;
    f_dns = false;
    f_s = false;
    f_h = false;
    f_m = false;
    f_mks = false;
    _read();
}

void iact_t::time_t::_read() {
    m_dat0 = m__io->read_u2le();
    m_dat1 = m__io->read_u2le();
    m_dat2 = m__io->read_u2le();
    m_dat3 = m__io->read_u2le();
}

iact_t::time_t::~time_t() {
}

int32_t iact_t::time_t::mls() {
    if (f_mls)
        return m_mls;
    m_mls = ((dat1() & 2046) >> 1);
    f_mls = true;
    return m_mls;
}

int32_t iact_t::time_t::dns() {
    if (f_dns)
        return m_dns;
    m_dns = ((dat0() & 127) * 10);
    f_dns = true;
    return m_dns;
}

int32_t iact_t::time_t::s() {
    if (f_s)
        return m_s;
    m_s = (((dat1() & 63488) >> 11) | ((dat2() & 1) << 5));
    f_s = true;
    return m_s;
}

int32_t iact_t::time_t::h() {
    if (f_h)
        return m_h;
    m_h = ((dat2() & 3968) >> 7);
    f_h = true;
    return m_h;
}

int32_t iact_t::time_t::m() {
    if (f_m)
        return m_m;
    m_m = ((dat2() & 126) >> 1);
    f_m = true;
    return m_m;
}

int32_t iact_t::time_t::mks() {
    if (f_mks)
        return m_mks;
    m_mks = (((dat0() & 65408) >> 7) | ((dat1() & 1) << 9));
    f_mks = true;
    return m_mks;
}
