// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "t133_grande.h"



t133_grande_t::t133_grande_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, t133_grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void t133_grande_t::_read() {
    m_links = new std::vector<link_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_links->push_back(new link_t(m__io, this, m__root));
            i++;
        }
    }
}

t133_grande_t::~t133_grande_t() {
    for (std::vector<link_t*>::iterator it = m_links->begin(); it != m_links->end(); ++it) {
        delete *it;
    }
    delete m_links;
}

t133_grande_t::link_t::link_t(kaitai::kstream* p__io, t133_grande_t* p__parent, t133_grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void t133_grande_t::link_t::_read() {
    int l_packages = 32;
    m_packages = new std::vector<package_t*>();
    m_packages->reserve(l_packages);
    for (int i = 0; i < l_packages; i++) {
        m_packages->push_back(new package_t(m__io, this, m__root));
    }
    m_additional_info = new additional_info_t(m__io, this, m__root);
}

t133_grande_t::link_t::~link_t() {
    for (std::vector<package_t*>::iterator it = m_packages->begin(); it != m_packages->end(); ++it) {
        delete *it;
    }
    delete m_packages;
    delete m_additional_info;
}

t133_grande_t::package_t::package_t(kaitai::kstream* p__io, t133_grande_t::link_t* p__parent, t133_grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void t133_grande_t::package_t::_read() {
    m_h = m__io->read_u2le();
    m_m = m__io->read_u2le();
    m_s = m__io->read_u2le();
    m_ms = m__io->read_u2le();
    m_optical_line_length = m__io->read_u2le();
    m_event_number = m__io->read_u4le();
}

t133_grande_t::package_t::~package_t() {
}

t133_grande_t::header_t::header_t(kaitai::kstream* p__io, t133_grande_t::additional_info_t* p__parent, t133_grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void t133_grande_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xFF\xFF", 2));
    m_transfer_attribute = m__io->ensure_fixed_contents(std::string("\xA0", 1));
    m_status = m__io->read_u1();
    m_package_size = m__io->read_u2le();
    m_request_address = m__io->read_u1();
    m_event_number = m__io->read_u4le();
    m_vme_addres = m__io->read_u4le();
}

t133_grande_t::header_t::~header_t() {
}

t133_grande_t::additional_info_t::additional_info_t(kaitai::kstream* p__io, t133_grande_t::link_t* p__parent, t133_grande_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void t133_grande_t::additional_info_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    int l_data = ((header()->package_size() - 9) / 2);
    m_data = new std::vector<uint16_t>();
    m_data->reserve(l_data);
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(m__io->read_u2le());
    }
    m_cluster_number = m__io->read_u1();
    m_h = m__io->read_u2le();
    m_m = m__io->read_u2le();
    m_s = m__io->read_u2le();
    m_ms = m__io->read_u2le();
    m_optical_line_length = m__io->read_u2le();
    m_event_number = m__io->read_u4le();
}

t133_grande_t::additional_info_t::~additional_info_t() {
    delete m_header;
    delete m_data;
}
