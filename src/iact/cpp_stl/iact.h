#ifndef IACT_H_
#define IACT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class iact_t : public kaitai::kstruct {

public:
    class package_t;
    class data_t;
    class chanel_t;
    class maroc_struct_t;
    class header_t;
    class time_t;

    iact_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, iact_t* p__root = 0);

private:
    void _read();

public:
    ~iact_t();

    class package_t : public kaitai::kstruct {

    public:

        package_t(kaitai::kstream* p__io, iact_t* p__parent = 0, iact_t* p__root = 0);

    private:
        void _read();

    public:
        ~package_t();

    private:
        header_t* m_header;
        data_t* m_data;
        std::string m_end_of_file;
        iact_t* m__root;
        iact_t* m__parent;

    public:
        header_t* header() const { return m_header; }
        data_t* data() const { return m_data; }
        std::string end_of_file() const { return m_end_of_file; }
        iact_t* _root() const { return m__root; }
        iact_t* _parent() const { return m__parent; }
    };

    class data_t : public kaitai::kstruct {

    public:

        data_t(kaitai::kstream* p__io, iact_t::package_t* p__parent = 0, iact_t* p__root = 0);

    private:
        void _read();

    public:
        ~data_t();

    private:
        std::vector<chanel_t*>* m_chanels;
        iact_t* m__root;
        iact_t::package_t* m__parent;

    public:
        std::vector<chanel_t*>* chanels() const { return m_chanels; }
        iact_t* _root() const { return m__root; }
        iact_t::package_t* _parent() const { return m__parent; }
    };

    class chanel_t : public kaitai::kstruct {

    public:

        chanel_t(kaitai::kstream* p__io, iact_t::data_t* p__parent = 0, iact_t* p__root = 0);

    private:
        void _read();

    public:
        ~chanel_t();

    private:
        uint16_t m_big;
        uint16_t m_small;
        iact_t* m__root;
        iact_t::data_t* m__parent;

    public:
        uint16_t big() const { return m_big; }
        uint16_t small() const { return m_small; }
        iact_t* _root() const { return m__root; }
        iact_t::data_t* _parent() const { return m__parent; }
    };

    class maroc_struct_t : public kaitai::kstruct {

    public:

        maroc_struct_t(kaitai::kstream* p__io, iact_t::header_t* p__parent = 0, iact_t* p__root = 0);

    private:
        void _read();

    public:
        ~maroc_struct_t();

    private:
        uint64_t m_maroc_nuber;
        uint64_t m_skip;
        iact_t* m__root;
        iact_t::header_t* m__parent;

    public:
        uint64_t maroc_nuber() const { return m_maroc_nuber; }
        uint64_t skip() const { return m_skip; }
        iact_t* _root() const { return m__root; }
        iact_t::header_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, iact_t::package_t* p__parent = 0, iact_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        std::string m_magic;
        uint16_t m_size;
        uint32_t m_event_number;
        uint32_t m_reserved;
        time_t* m_time;
        maroc_struct_t* m_maroc_struct;
        iact_t* m__root;
        iact_t::package_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t size() const { return m_size; }
        uint32_t event_number() const { return m_event_number; }
        uint32_t reserved() const { return m_reserved; }
        time_t* time() const { return m_time; }
        maroc_struct_t* maroc_struct() const { return m_maroc_struct; }
        iact_t* _root() const { return m__root; }
        iact_t::package_t* _parent() const { return m__parent; }
    };

    class time_t : public kaitai::kstruct {

    public:

        time_t(kaitai::kstream* p__io, iact_t::header_t* p__parent = 0, iact_t* p__root = 0);

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
        iact_t* m__root;
        iact_t::header_t* m__parent;

    public:
        uint16_t dat0() const { return m_dat0; }
        uint16_t dat1() const { return m_dat1; }
        uint16_t dat2() const { return m_dat2; }
        uint16_t dat3() const { return m_dat3; }
        iact_t* _root() const { return m__root; }
        iact_t::header_t* _parent() const { return m__parent; }
    };

private:
    std::vector<package_t*>* m_packages;
    iact_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<package_t*>* packages() const { return m_packages; }
    iact_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // IACT_H_
