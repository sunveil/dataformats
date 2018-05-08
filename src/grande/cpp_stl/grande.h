#ifndef GRANDE_H_
#define GRANDE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class grande_t : public kaitai::kstruct {

public:
    class package_t;
    class cluster_info_t;
    class data_t;
    class channel_info_t;
    class time_t;

    grande_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, grande_t* p__root = 0);

private:
    void _read();

public:
    ~grande_t();

    class package_t : public kaitai::kstruct {

    public:

        enum data_types_t {
            DATA_TYPES_LINK1 = 3032,
            DATA_TYPES_LINK2 = 3033,
            DATA_TYPES_LINK3 = 3034,
            DATA_TYPES_LINK4 = 3035
        };

        package_t(kaitai::kstream* p__io, grande_t* p__parent = 0, grande_t* p__root = 0);

    private:
        void _read();

    public:
        ~package_t();

    private:
        data_types_t m_data_type;
        uint16_t m_package_size;
        uint32_t m_event_number;
        uint32_t m_error_count;
        time_t* m_time;
        cluster_info_t* m_cluster_info;
        std::vector<data_t*>* m_data;
        std::string m_end_of_package;
        grande_t* m__root;
        grande_t* m__parent;

    public:
        data_types_t data_type() const { return m_data_type; }
        uint16_t package_size() const { return m_package_size; }
        uint32_t event_number() const { return m_event_number; }
        uint32_t error_count() const { return m_error_count; }
        time_t* time() const { return m_time; }
        cluster_info_t* cluster_info() const { return m_cluster_info; }
        std::vector<data_t*>* data() const { return m_data; }
        std::string end_of_package() const { return m_end_of_package; }
        grande_t* _root() const { return m__root; }
        grande_t* _parent() const { return m__parent; }
    };

    class cluster_info_t : public kaitai::kstruct {

    public:

        cluster_info_t(kaitai::kstream* p__io, grande_t::package_t* p__parent = 0, grande_t* p__root = 0);

    private:
        void _read();

    public:
        ~cluster_info_t();

    private:
        uint64_t m_cluster_number;
        uint64_t m_reserved;
        uint64_t m_optical_line_lenght;
        grande_t* m__root;
        grande_t::package_t* m__parent;

    public:
        uint64_t cluster_number() const { return m_cluster_number; }
        uint64_t reserved() const { return m_reserved; }
        uint64_t optical_line_lenght() const { return m_optical_line_lenght; }
        grande_t* _root() const { return m__root; }
        grande_t::package_t* _parent() const { return m__parent; }
    };

    class data_t : public kaitai::kstruct {

    public:

        data_t(kaitai::kstream* p__io, grande_t::package_t* p__parent = 0, grande_t* p__root = 0);

    private:
        void _read();

    public:
        ~data_t();

    private:
        uint32_t m_vme_addres;
        uint16_t m_data_count;
        channel_info_t* m_channel_info;
        std::vector<uint16_t>* m_data;
        grande_t* m__root;
        grande_t::package_t* m__parent;

    public:
        uint32_t vme_addres() const { return m_vme_addres; }
        uint16_t data_count() const { return m_data_count; }
        channel_info_t* channel_info() const { return m_channel_info; }
        std::vector<uint16_t>* data() const { return m_data; }
        grande_t* _root() const { return m__root; }
        grande_t::package_t* _parent() const { return m__parent; }
    };

    class channel_info_t : public kaitai::kstruct {

    public:

        channel_info_t(kaitai::kstream* p__io, grande_t::data_t* p__parent = 0, grande_t* p__root = 0);

    private:
        void _read();

    public:
        ~channel_info_t();

    private:
        uint64_t m_channel_number;
        bool m_bank_number;
        uint64_t m_link_number;
        uint64_t m_reserved;
        grande_t* m__root;
        grande_t::data_t* m__parent;

    public:
        uint64_t channel_number() const { return m_channel_number; }
        bool bank_number() const { return m_bank_number; }
        uint64_t link_number() const { return m_link_number; }
        uint64_t reserved() const { return m_reserved; }
        grande_t* _root() const { return m__root; }
        grande_t::data_t* _parent() const { return m__parent; }
    };

    class time_t : public kaitai::kstruct {

    public:

        time_t(kaitai::kstream* p__io, grande_t::package_t* p__parent = 0, grande_t* p__root = 0);

    private:
        void _read();

    public:
        ~time_t();

    private:
        bool f_mls;
        int32_t m_mls;

    public:
        int32_t mls();

    private:
        bool f_dns;
        int32_t m_dns;

    public:
        int32_t dns();

    private:
        bool f_s;
        int32_t m_s;

    public:
        int32_t s();

    private:
        bool f_h;
        int32_t m_h;

    public:
        int32_t h();

    private:
        bool f_m;
        int32_t m_m;

    public:
        int32_t m();

    private:
        bool f_mks;
        int32_t m_mks;

    public:
        int32_t mks();

    private:
        uint16_t m_dat0;
        uint16_t m_dat1;
        uint16_t m_dat2;
        uint16_t m_dat3;
        grande_t* m__root;
        grande_t::package_t* m__parent;

    public:
        uint16_t dat0() const { return m_dat0; }
        uint16_t dat1() const { return m_dat1; }
        uint16_t dat2() const { return m_dat2; }
        uint16_t dat3() const { return m_dat3; }
        grande_t* _root() const { return m__root; }
        grande_t::package_t* _parent() const { return m__parent; }
    };

private:
    std::vector<package_t*>* m_packages;
    grande_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<package_t*>* packages() const { return m_packages; }
    grande_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GRANDE_H_
