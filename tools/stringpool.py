#!/usr/bin/env python3

"""
Helper script for extracing an EMS client's StringPool.

pip3 install pefile
"""

import pefile
import struct

def handle_resource(pe, entry):
    data = pe.get_data(entry.data.struct.OffsetToData, entry.data.struct.Size)
    num_langs = num_strings = struct.unpack("<I", data[0:4])[0]
    num_strings = struct.unpack("<I", data[4:8])[0]
    data_base = 8 + num_strings * num_langs * 8
    for i in range(num_strings):
        offset = struct.unpack("<I", data[8+i*8:12+i*8])[0]
        len = struct.unpack("<I", data[12+i*8:16+i*8])[0]
        str_data = data[data_base+offset:data_base+offset+len]

        the_str = ""
        for j in range(len):
            shift = str_data[j] << (8 - (offset + j) % 8)
            the_str += chr(((shift & 0xFF) | (shift >> 8)) ^ 0xAA)

        print("{:04d} {:s}".format(i, the_str))


def handle_file(filename: str):
    pe = pefile.PE(filename)
    for entrydata in pe.DIRECTORY_ENTRY_RESOURCE.entries:
        if entrydata.id == 10:  # RCDATA
            for entry in entrydata.directory.entries:
                if entry.id == 27892:
                    handle_resource(pe, entry.directory.entries[0])
                    return
    
    print("StringPool resource not found")


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <MS.exe>")
    else:
        handle_file(sys.argv[1])
