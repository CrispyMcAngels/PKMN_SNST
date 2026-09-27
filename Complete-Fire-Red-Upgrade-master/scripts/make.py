#!/usr/bin/env python3

import os
import shutil
import sys

############
# Options go here.
############

ROM_NAME = "BPRE0.gba"  # The name of your rom
OFFSET_TO_PUT = 0x1609250
SEARCH_FREE_SPACE = False  # Set to True if you want the script to search for free space
                           # Set to False if you don't want to search for free space as you for example update the engine
SPACE_END = 0x1810000  # First byte after OFFSET_TO_PUT that's already used (the DPE). The engine must end before it.
ROM2_START = 0x1100000  # Second free block, for the graphics folders listed in ROM2_GRAPHICS_DIRS (scripts/build.py)
ROM2_END = 0x11B0000    # First used byte after it

#############
# Options end here.
#############

###############
# Functions start here.
###############


def MakeOffset0x100Aligned(offset: int) -> int:
    while offset % 16 != 0:
        offset += 1

    return offset


def FindOffsetToPut(rom, neededBytes: int, startOffset: int) -> int:
    offset = startOffset
    rom.seek(0, 2)
    maxPosition = rom.tell()
    numFoundBytes = 0

    while numFoundBytes < neededBytes:
        if offset + numFoundBytes >= maxPosition:
            print("End of file reached. Not enough free space.")
            return 0

        numFoundBytes += 1
        rom.seek(offset + numFoundBytes)
        if rom.read(1) != b'\xFF':
            offset = MakeOffset0x100Aligned(offset + numFoundBytes)
            numFoundBytes = 0

    return offset


def ChangeFileLine(filePath: str, lineToChange: int, replacement: str):
    with open(filePath, 'r') as file:
        copy = file.read()
        file.seek(0x0)
        lineNum = 1
        for line in file:
            if lineNum == lineToChange:
                copy = copy.replace(line, replacement)
                break
            lineNum += 1

    with open(filePath, 'w') as file:
        file.write(copy)


def EditLinker(offset: int):
    # With fixed space, the linker itself refuses to build if either region overflows
    length = hex(SPACE_END - offset) if SEARCH_FREE_SPACE is False else "32M"
    ChangeFileLine("linker.ld", 4, "\t\trom     : ORIGIN = (0x08000000 + " + hex(offset) + "), LENGTH = " + length + "\n")
    ChangeFileLine("linker.ld", 5, "\t\trom2    : ORIGIN = (0x08000000 + " + hex(ROM2_START) + "), LENGTH = " + hex(ROM2_END - ROM2_START) + "\n")


def EditInsert(offset: int):
    ChangeFileLine("./scripts/insert.py", 10, "OFFSET_TO_PUT = " + hex(offset) + '\n')
    ChangeFileLine("./scripts/insert.py", 11, 'SOURCE_ROM = "' + ROM_NAME + '"\n')


def BuildCode():
    if shutil.which('python3') is not None:
        result = os.system("python3 scripts/build.py")
    else:
        result = os.system("python scripts/build.py")

    if result != 0:  # Build wasn't sucessful
        sys.exit(1)


def CheckCodeFits(offset: int):
    """Stop before inserting if the engine would overwrite what comes after it."""
    size = os.path.getsize('build/output.bin')
    end = offset + size

    if SEARCH_FREE_SPACE is False and end > SPACE_END:
        print('Error! The engine is {:,} bytes and ends at 0x{:X}, {:,} bytes past SPACE_END (0x{:X}). Nothing was inserted.'
              .format(size, 0x08000000 + end, end - SPACE_END, 0x08000000 + SPACE_END))
        sys.exit(1)

    print('Engine: {:,} bytes at 0x{:X}-0x{:X}. {:,} bytes left before SPACE_END.'
          .format(size, 0x08000000 + offset, 0x08000000 + end, SPACE_END - end))

    rom2Size = os.path.getsize('build/output_rom2.bin') if os.path.isfile('build/output_rom2.bin') else 0
    if rom2Size > ROM2_END - ROM2_START:
        print('Error! The second region is {:,} bytes, but only {:,} fit between ROM2_START and ROM2_END. Nothing was inserted.'
              .format(rom2Size, ROM2_END - ROM2_START))
        sys.exit(1)

    print('Engine (second region): {:,} bytes at 0x{:X}-0x{:X}. {:,} bytes left before ROM2_END.'
          .format(rom2Size, 0x08000000 + ROM2_START, 0x08000000 + ROM2_START + rom2Size, ROM2_END - ROM2_START - rom2Size))


def InsertCode():
    if shutil.which('python3') is not None:
        os.system("python3 scripts/insert.py")
    else:
        os.system("python scripts/insert.py")


def ClearFromTo(rom, from_: int, to_: int):
    rom.seek(from_)
    for i in range(0, to_ - from_):
        rom.write(b'\xFF')

##############
# Functions end here.
##############


def main():
    try:
        with open(ROM_NAME, 'rb+') as rom:
            offset = OFFSET_TO_PUT
            if SEARCH_FREE_SPACE is True:
                offset = FindOffsetToPut(rom, 0x50000, MakeOffset0x100Aligned(offset))

            EditLinker(offset)
            EditInsert(offset)
            BuildCode()
            CheckCodeFits(offset)
            InsertCode()
            rom.close()

    except FileNotFoundError:
        print('Error: Could not find source rom: "' + ROM_NAME + '".\n'
              + 'Please make sure a rom with this name exists in the root.')


if __name__ == '__main__':
    main()
    