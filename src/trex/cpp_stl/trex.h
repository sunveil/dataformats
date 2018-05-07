#ifndef TREX_H_
#define TREX_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class trex_t : public kaitai::kstruct {

public:
    class link_t;
    class package_t;
    class header_t;
    class additional_info_t;

    trex_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, trex_t* p__root = 0);

private:
    void _read();

public:
    ~trex_t();

    class link_t : public kaitai::kstruct {

    public:

        link_t(kaitai::kstream* p__io, trex_t* p__parent = 0, trex_t* p__root = 0);

    private:
        void _read();

    public:
        ~link_t();

    private:
        std::vector<package_t*>* m_packages;
        additional_info_t* m_additional_info;
        trex_t* m__root;
        trex_t* m__parent;

    public:
        std::vector<package_t*>* packages() const { return m_packages; }
        additional_info_t* additional_info() const { return m_additional_info; }
        trex_t* _root() const { return m__root; }
        trex_t* _parent() const { return m__parent; }
    };

    class package_t : public kaitai::kstruct {

    public:

        package_t(kaitai::kstream* p__io, trex_t::link_t* p__parent = 0, trex_t* p__root = 0);

    private:
        void _read();

    public:
        ~package_t();

    private:
        uint16_t m_h;
        uint16_t m_m;
        uint16_t m_s;
        uint16_t m_ms;
        uint16_t m_optical_line_length;
        uint32_t m_event_number;
        trex_t* m__root;
        trex_t::link_t* m__parent;

    public:
        uint16_t h() const { return m_h; }
        uint16_t m() const { return m_m; }
        uint16_t s() const { return m_s; }
        uint16_t ms() const { return m_ms; }
        uint16_t optical_line_length() const { return m_optical_line_length; }
        uint32_t event_number() const { return m_event_number; }
        trex_t* _root() const { return m__root; }
        trex_t::link_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, trex_t::additional_info_t* p__parent = 0, trex_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        std::string m_magic;
        std::string m_transfer_attribute;
        uint8_t m_status;
        uint16_t m_package_size;
        uint8_t m_request_address;
        uint32_t m_event_number;
        uint32_t m_vme_addres;
        trex_t* m__root;
        trex_t::additional_info_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string transfer_attribute() const { return m_transfer_attribute; }
        uint8_t status() const { return m_status; }
        uint16_t package_size() const { return m_package_size; }
        uint8_t request_address() const { return m_request_address; }
        uint32_t event_number() const { return m_event_number; }
        uint32_t vme_addres() const { return m_vme_addres; }
        trex_t* _root() const { return m__root; }
        trex_t::additional_info_t* _parent() const { return m__parent; }
    };

    class additional_info_t : public kaitai::kstruct {

    public:

        additional_info_t(kaitai::kstream* p__io, trex_t::link_t* p__parent = 0, trex_t* p__root = 0);

    private:
        void _read();

    public:
        ~additional_info_t();

    private:
        header_t* m_header;
        std::vector<uint16_t>* m_data;
        uint8_t m_cluster_number;
        uint16_t m_h;
        uint16_t m_m;
        uint16_t m_s;
        uint16_t m_ms;
        uint16_t m_optical_line_length;
        uint32_t m_event_number;
        trex_t* m__root;
        trex_t::link_t* m__parent;

    public:
        header_t* header() const { return m_header; }
        std::vector<uint16_t>* data() const { return m_data; }
        uint8_t cluster_number() const { return m_cluster_number; }
        uint16_t h() const { return m_h; }
        uint16_t m() const { return m_m; }
        uint16_t s() const { return m_s; }
        uint16_t ms() const { return m_ms; }
        uint16_t optical_line_length() const { return m_optical_line_length; }
        uint32_t event_number() const { return m_event_number; }
        trex_t* _root() const { return m__root; }
        trex_t::link_t* _parent() const { return m__parent; }
    };

private:
    std::vector<link_t*>* m_links;
    trex_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<link_t*>* links() const { return m_links; }
    trex_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TREX_H_
