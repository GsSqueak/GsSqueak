LISP-primitives
complexP: aConsCell
  ^ self test: (aConsCell car isComplex or: [ aConsCell car isNumber ])