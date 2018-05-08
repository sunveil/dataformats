import trex
import fnmatch
import sys
import os


def main():
    args_len = len(sys.argv)
    if args_len != 2:
        raise Exception('Not enough actual parameters')
    root_dir = sys.argv[1]
    is_dir = os.path.isdir(root_dir)
    if not is_dir:
        raise Exception('Not enough actual parameters')
    total_count = 0
    processed_count = 0
    for dir_name, subdir_list, file_list in os.walk(root_dir):
        for file_name in fnmatch.filter(file_list, "*.[0-9][0-9][0-9]"):
            path = os.path.join(dir_name, file_name)
            total_count += 1
            try:
                trex_reader = trex.Trex.from_file(path)
                processed_count += 1
                print('File:', path, end=' - ')
                print('Links count', len(trex_reader.links), sep=': ')
            except:
                print(path, 'Bad file format', sep=' - ')
                pass
    print('Total files in directory', total_count, sep=' = ')
    print('Processed files', processed_count, sep=' = ')


if __name__ == '__main__':
    main()
