import trex
import grande
import t133
import fnmatch
import sys
import os
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('folder', help='input folder for processing')
    args = parser.parse_args()
    root_dir = args.folder
    is_dir = os.path.isdir(root_dir)
    if not is_dir:
        raise Exception('It is not a directory')
    total_count = 0
    processed_count = 0
    for dir_name, subdir_list, file_list in os.walk(root_dir):
        for file_name in fnmatch.filter(file_list, "*.[0-9][0-9][0-9]"):
            path = os.path.join(dir_name, file_name)
            total_count += 1
            reader = open(path)
            if reader is not None:
                processed_count += 1
                print_info(reader, path)
            else:
                print(path, 'Bad file format', sep=' - ')

    print('Total files in directory', total_count, sep=' = ')
    print('Processed files', processed_count, sep=' = ')


def open_grande(file_name):
    try:
        return trex.Trex.from_file(file_name)
    except:
        return None


def open_trex(file_name):
    try:
        return grande.Grande.from_file(file_name)
    except:
        return None


def open_t133(file_name):
    try:
        return t133.T133.from_file(file_name)
    except:
        return None


def open(file_name):
    grande = open_grande(file_name)
    if grande is not None:
        return grande
    trex = open_trex(file_name)
    if trex is not None:
        return trex
    t133 = open_t133(file_name)
    if t133 is not None:
        return t133
    return None


def print_info(reader, path):
    if type(reader) is grande.Grande:
        print('File:', path, end=' - ')
        print('Packages  count', len(reader.packages), sep=': ')
        return
    if type(reader) is trex.Trex:
        print('File:', path, end=' - ')
        print('Links count', len(reader.links), sep=': ')
    if type(reader) is t133.T133:
        print('File:', path, end=' - ')
        print('Links count', len(reader.links), sep=': ')


if __name__ == '__main__':
    main()
