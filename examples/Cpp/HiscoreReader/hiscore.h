#ifndef HISCORE_H_
#define HISCORE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitaistruct.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class hiscore_t : public kaitai::kstruct {

public:
    class package_t;
    class header_t;
    class data_block_t;
    class time_t;

    hiscore_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, hiscore_t* p__root = 0);

private:
    void _read();

public:
    ~hiscore_t();

    class package_t : public kaitai::kstruct {

    public:

        package_t(kaitai::kstream* p__io, hiscore_t* p__parent = 0, hiscore_t* p__root = 0);

    private:
        void _read();

    public:
        ~package_t();

    private:
        header_t* m_hdr;
        std::vector<data_block_t*>* m_data;
        std::string m_end_of_file;
        hiscore_t* m__root;
        hiscore_t* m__parent;

    public:
        header_t* hdr() const { return m_hdr; }
        std::vector<data_block_t*>* data() const { return m_data; }
        std::string end_of_file() const { return m_end_of_file; }
        hiscore_t* _root() const { return m__root; }
        hiscore_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, hiscore_t::package_t* p__parent = 0, hiscore_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        std::string m_magic;
        uint16_t m_sz;
        uint32_t m_event_number;
        uint32_t m_stop_position;
        time_t* m_time;
        uint16_t m_ip;
        uint16_t m_station_number;
        hiscore_t* m__root;
        hiscore_t::package_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t sz() const { return m_sz; }
        uint32_t event_number() const { return m_event_number; }
        uint32_t stop_position() const { return m_stop_position; }
        time_t* time() const { return m_time; }
        uint16_t ip() const { return m_ip; }
        uint16_t station_number() const { return m_station_number; }
        hiscore_t* _root() const { return m__root; }
        hiscore_t::package_t* _parent() const { return m__parent; }
    };

    class data_block_t : public kaitai::kstruct {

    public:

        data_block_t(kaitai::kstream* p__io, hiscore_t::package_t* p__parent = 0, hiscore_t* p__root = 0);

    private:
        void _read();

    public:
        ~data_block_t();

    private:
        uint16_t m_offset;
        uint16_t m_len;
        std::vector<uint16_t>* m_data;
        hiscore_t* m__root;
        hiscore_t::package_t* m__parent;

    public:
        uint16_t offset() const { return m_offset; }
        uint16_t len() const { return m_len; }
        std::vector<uint16_t>* data() const { return m_data; }
        hiscore_t* _root() const { return m__root; }
        hiscore_t::package_t* _parent() const { return m__parent; }
    };

    class time_t : public kaitai::kstruct {

    public:

        time_t(kaitai::kstream* p__io, hiscore_t::header_t* p__parent = 0, hiscore_t* p__root = 0);

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
        hiscore_t* m__root;
        hiscore_t::header_t* m__parent;

    public:
        uint16_t dat0() const { return m_dat0; }
        uint16_t dat1() const { return m_dat1; }
        uint16_t dat2() const { return m_dat2; }
        uint16_t dat3() const { return m_dat3; }
        hiscore_t* _root() const { return m__root; }
        hiscore_t::header_t* _parent() const { return m__parent; }
    };

private:
    std::vector<package_t*>* m_packages;
    hiscore_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<package_t*>* packages() const { return m_packages; }
    hiscore_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // HISCORE_H_
