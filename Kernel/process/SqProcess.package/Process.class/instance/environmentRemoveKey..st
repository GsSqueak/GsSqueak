accessing
environmentRemoveKey: key
  ^ self environmentRemoveKey: key ifAbsent: [ self environmentKeyNotFound ]
