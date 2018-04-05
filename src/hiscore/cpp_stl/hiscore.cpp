// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "hiscore.h"



hiscore_t::hiscore_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, hiscore_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void hiscore_t::_read() {
    m_packages = new std::vector<package_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packages->push_back(new package_t(m__io, this, m__root));
            i++;
        }
    }
}

hiscore_t::~hiscore_t() {
    for (std::vector<package_t*>::iterator it = m_packages->begin(); it != m_packages->end(); ++it) {
        delete *it;
    }
    delete m_packages;
}

hiscore_t::package_t::package_t(kaitai::kstream* p__io, hiscore_t* p__parent, hiscore_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hiscore_t::package_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    int l_data = 9;
    m_data = new std::vector<data_block_t*>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(new data_block_t(m__io, this, m__root));
    }
    m_end_of_file = m__io->ensure_fixed_contents(std::string("\xFF\xFF\xFF\xFF", 4));
}

hiscore_t::package_t::~package_t() {
    delete m_hdr;
    for (std::vector<data_block_t*>::iterator it = m_data->begin(); it != m_data->end(); ++it) {
        delete *it;
    }
    delete m_data;
}

hiscore_t::header_t::header_t(kaitai::kstream* p__io, hiscore_t::package_t* p__parent, hiscore_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hiscore_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xC0\x0B", 2));
    m_sz = m__io->read_u2le();
    m_event_number = m__io->read_u4le();
    m_stop_position = m__io->read_u4le();
    m_time = new time_t(m__io, this, m__root);
    m_ip = m__io->read_u2le();
    m_station_number = m__io->read_u2le();
}

hiscore_t::header_t::~header_t() {
    delete m_time;
}

hiscore_t::data_block_t::data_block_t(kaitai::kstream* p__io, hiscore_t::package_t* p__parent, hiscore_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hiscore_t::data_block_t::_read() {
    m_offset = m__io->read_u2le();
    m_len = m__io->read_u2le();
    int l_data = len();
    m_data = new std::vector<uint16_t>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_u2le());
    }
}

hiscore_t::data_block_t::~data_block_t() {
    delete m_data;
}

hiscore_t::time_t::time_t(kaitai::kstream* p__io, hiscore_t::header_t* p__parent, hiscore_t* p__root) : kaitai::kstruct(p__io) {
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

void hiscore_t::time_t::_read() {
    m_dat0 = m__io->read_u2le();
    m_dat1 = m__io->read_u2le();
    m_dat2 = m__io->read_u2le();
    m_dat3 = m__io->read_u2le();
}

hiscore_t::time_t::~time_t() {
}

int32_t hiscore_t::time_t::mls() {
    if (f_mls)
        return m_mls;
    m_mls = ((dat1() & 2046) >> 1);
    f_mls = true;
    return m_mls;
}

int32_t hiscore_t::time_t::dns() {
    if (f_dns)
        return m_dns;
    m_dns = ((dat0() & 127) * 10);
    f_dns = true;
    return m_dns;
}

int32_t hiscore_t::time_t::s() {
    if (f_s)
        return m_s;
    m_s = (((dat1() & 63488) >> 11) | ((dat2() & 1) << 5));
    f_s = true;
    return m_s;
}

int32_t hiscore_t::time_t::h() {
    if (f_h)
        return m_h;
    m_h = ((dat2() & 3968) >> 7);
    f_h = true;
    return m_h;
}

int32_t hiscore_t::time_t::m() {
    if (f_m)
        return m_m;
    m_m = ((dat2() & 126) >> 1);
    f_m = true;
    return m_m;
}

int32_t hiscore_t::time_t::mks() {
    if (f_mks)
        return m_mks;
    m_mks = (((dat0() & 65408) >> 7) | ((dat1() & 1) << 9));
    f_mks = true;
    return m_mks;
}
