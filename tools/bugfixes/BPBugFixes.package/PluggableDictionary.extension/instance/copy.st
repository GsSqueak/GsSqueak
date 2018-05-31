*BPBugFixes
copy
  | newVersion |
  newVersion := super copy.
  newVersion
    hashBlock: hashBlock copy;
    equalBlock: equalBlock copy.
  ^ newVersion