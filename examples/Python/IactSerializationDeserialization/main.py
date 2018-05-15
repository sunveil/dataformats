import iact
import hashlib
import os
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('infile', help='input file for processing')
    parser.add_argument('outfile', help='output file')
    args = parser.parse_args()
    in_file_path = args.infile
    is_file = os.path.isfile(in_file_path)
    if not is_file:
        raise Exception('It is not a file')

    out_file_path = args.outfile
    out = open(out_file_path, 'wb+')

    iact_reader = iact.Iact.from_file(in_file_path)

    for package in iact_reader.packages:
        # begin header
        out.write(package.header.magic)
        out.write(to_bytes(package.header.size, 2))
        out.write(to_bytes(package.header.event_number, 4))
        out.write(to_bytes(package.header.reserved, 4))
        # begin time
        out.write(to_bytes(package.header.time.dat0, 2))
        out.write(to_bytes(package.header.time.dat1, 2))
        out.write(to_bytes(package.header.time.dat2, 2))
        out.write(to_bytes(package.header.time.dat3, 2))
        # end time
        # begin maroc
        maroc_number = package.header.maroc_struct.maroc_nuber
        maroc_skip = package.header.maroc_struct.maroc_nuber >> 27
        maroc = maroc_number & maroc_skip
        out.write(to_bytes(maroc, 4))
        # end maroc
        for chanel in package.data.chanels:
            out.write(to_bytes(chanel.big, 2))
            out.write(to_bytes(chanel.small, 2))
        out.write(b"\xFF\xFF\xFF\xFF")
    out.close()
    print_info(in_file_path, out, out_file_path)


def print_info(in_file_path, out, out_file_path):
    print('Input file:', in_file_path)
    print('Output file:', out)
    hash_in = md5(in_file_path)
    hash_out = md5(out_file_path)
    print('hash_in:', hash_in)
    print('hash_out:', hash_out)
    if hash_in == hash_out:
        print('Equals')
    else:
        print('Not equals')


def md5(fname):
    hash_md5 = hashlib.md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def to_bytes(x, size, endian='little'):
    return x.to_bytes(size, endian)


if __name__ == '__main__':
    main()
