#!/usr/bin/env python3

import sys


# ===== STEP 1 =====

#    config file
# -> mapping from any-letters to emoji chars

emoji_map = {}
# Read the config file into emoji_map
for i, line in enumerate(open(sys.argv[1]).read().split("\n")):
    l = line.strip()

    # Early return if the line is empty or begins with '#'
    if l == "" or l.startswith("#"):
        continue
    if l[1] != ":":
        print(f"Line #{i} ({l}) doesn't have a ':' as the 2nd char")
        continue

    base_char = l[0]

    # Only one emoji - map it to exactly the same case
    if len(l) == 3:
        emoji_map[base_char] = l[2]
    if len(l) == 4:
        emoji_map[base_char.lower()] = l[2]
        emoji_map[base_char.upper()] = l[3]


# ===== STEP 2 =====

#    mapping from any-letters to emoji chars
# -> mapping from any-case letters to unicode codepoints

emoji_unicode_map = {
    l: "U" + ("%x" % ord(e)).upper()
    for l, e in emoji_map.items()
}


# ===== STEP 3 =====

#    mapping from any-case letters to codepoints 
# -> mapping from lower-case letters to values to replace each column of xmodmap (or None)
# 
# To map to 'Mode_switch' and 'Mode_switch + Shift', we add to the 3rd and 4th columsn

column_overwrite_map = {
    l: [None] * 2 + [
        emoji_unicode_map.get(l),
        emoji_unicode_map.get(l.upper())
    ] for l in set([x.lower() for x in emoji_unicode_map])
}


# ===== STEP 4 =====

# read the current keybindings, so we don't overwrite anything

# key_map_columns will take the form of a dict between lower-case letters and lists of chars
# that they correspond to.
# So for example, the entry of `xmodmap -pke` that is `keycode  38 = a A a A ae AE ae` would
# result in the following entry:
# {'a': ['a', 'A', 'a', 'A', 'ae', 'AE', 'ae']}
key_map_columns = {}

# We do this by reading the current keybindings with `xmodmap -pke`, and finding the entries
# that correspond to letters.  These will be the ones where the result of the unmodified key
# is that letter.
# 
# For example, the line `keycode 38 = a A ...` corresponds to the letter 'a'

import subprocess
import sys
 
def get_stdout(cmd):
    """ Reads stdout of running a command. """
    proc = subprocess.Popen(cmd,
        stdout = subprocess.PIPE,
        stderr = subprocess.PIPE,
    )
    stdout, _stderr = proc.communicate()
    return stdout

for line in get_stdout(["xmodmap", "-pke"]).decode('utf-8').split('\n'):
    # Early return if the line doesn't have an "="
    if "=" not in line:
        continue
    # Otherwise, we take the contents of the right hand side, strip it and split by space
    # This gives us the columns as xmodmap expects them
    cols = line.split("=")[1].strip().split(' ')
    
    # If the cols have a single char as their first column, then they must correspond to a
    # letter (or a number), so we add it to key_map_columns under its first column
    if cols != [] and len(cols[0]) == 1:
        key_map_columns[cols[0]] = cols


# ===== STEP 5 =====
# execute the `xmodmap` commands to rebind the keys
for (lower_case_letter, column_overwrite_values) in column_overwrite_map.items():
    columns_to_overwrite = key_map_columns[lower_case_letter]

    # Append `None`s to the end of `column_overwrite_values` to match the length of
    # `columns_to_overwrite`
    while len(column_overwrite_values) < len(columns_to_overwrite):
        column_overwrite_values.append(None)

    # Combine the columns together, allowing `column_overwrite_values` to override
    # `columns_to_overwrite`
    new_columns = [
        override or default
        for (override, default) in zip(column_overwrite_values, columns_to_overwrite)
    ]

    # Build the columns into a full xmodmap command string
    print(f"keysym {lower_case_letter} = {' '.join(new_columns)}")

    # Output the command to bind the keys
