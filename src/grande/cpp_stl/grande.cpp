// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "grande.h"



grande_t::grande_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void grande_t::_read() {
    m_packages = new std::vector<package_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packages->push_back(new package_t(m__io, this, m__root));
            i++;
        }
    }
}

grande_t::~grande_t() {
    for (std::vector<package_t*>::iterator it = m_packages->begin(); it != m_packages->end(); ++it) {
        delete *it;
    }
    delete m_packages;
}

grande_t::package_t::package_t(kaitai::kstream* p__io, grande_t* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grande_t::package_t::_read() {
    m_data_type = static_cast<grande_t::package_t::data_types_t>(m__io->read_u2le());
    m_package_size = m__io->read_u2le();
    m_event_number = m__io->read_u4le();
    m_error_count = m__io->read_u4le();
    m_time = new time_t(m__io, this, m__root);
    m_cluster_info = new cluster_info_t(m__io, this, m__root);
    int l_data = 8;
    m_data = new std::vector<data_t*>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(new data_t(m__io, this, m__root));
    }
    m_end_of_package = m__io->ensure_fixed_contents(std::string("\xFF\xFF\xFF\xFF", 4));
}

grande_t::package_t::~package_t() {
    delete m_time;
    delete m_cluster_info;
    for (std::vector<data_t*>::iterator it = m_data->begin(); it != m_data->end(); ++it) {
        delete *it;
    }
    delete m_data;
}

grande_t::cluster_info_t::cluster_info_t(kaitai::kstream* p__io, grande_t::package_t* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grande_t::cluster_info_t::_read() {
    m_cluster_number = m__io->read_bits_int(8);
    m_reserved = m__io->read_bits_int(8);
    m_optical_line_lenght = m__io->read_bits_int(16);
}

grande_t::cluster_info_t::~cluster_info_t() {
}

grande_t::data_t::data_t(kaitai::kstream* p__io, grande_t::package_t* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grande_t::data_t::_read() {
    m_vme_addres = m__io->read_u4le();
    m_data_count = m__io->read_u2le();
    m_channel_info = new channel_info_t(m__io, this, m__root);
    int l_data = data_count();
    m_data = new std::vector<uint16_t>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_u2le());
    }
}

grande_t::data_t::~data_t() {
    delete m_channel_info;
    delete m_data;
}

grande_t::channel_info_t::channel_info_t(kaitai::kstream* p__io, grande_t::data_t* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void grande_t::channel_info_t::_read() {
    m_channel_number = m__io->read_bits_int(4);
    m_bank_number = m__io->read_bits_int(1);
    m_link_number = m__io->read_bits_int(2);
    m_reserved = m__io->read_bits_int(9);
}

grande_t::channel_info_t::~channel_info_t() {
}

grande_t::time_t::time_t(kaitai::kstream* p__io, grande_t::package_t* p__parent, grande_t* p__root) : kaitai::kstruct(p__io) {
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

void grande_t::time_t::_read() {
    m_dat0 = m__io->read_u2le();
    m_dat1 = m__io->read_u2le();
    m_dat2 = m__io->read_u2le();
    m_dat3 = m__io->read_u2le();
}

grande_t::time_t::~time_t() {
}

int32_t grande_t::time_t::mls() {
    if (f_mls)
        return m_mls;
    m_mls = ((dat1() & 2046) >> 1);
    f_mls = true;
    return m_mls;
}

int32_t grande_t::time_t::dns() {
    if (f_dns)
        return m_dns;
    m_dns = ((dat0() & 127) * 10);
    f_dns = true;
    return m_dns;
}

int32_t grande_t::time_t::s() {
    if (f_s)
        return m_s;
    m_s = (((dat1() & 63488) >> 11) | ((dat2() & 1) << 5));
    f_s = true;
    return m_s;
}

int32_t grande_t::time_t::h() {
    if (f_h)
        return m_h;
    m_h = ((dat2() & 3968) >> 7);
    f_h = true;
    return m_h;
}

int32_t grande_t::time_t::m() {
    if (f_m)
        return m_m;
    m_m = ((dat2() & 126) >> 1);
    f_m = true;
    return m_m;
}

int32_t grande_t::time_t::mks() {
    if (f_mks)
        return m_mks;
    m_mks = (((dat0() & 65408) >> 7) | ((dat1() & 1) << 9));
    f_mks = true;
    return m_mks;
}
