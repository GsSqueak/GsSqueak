accessing
pageNamed: aName
  ^ self pages detect: [ :p | p knownName = aName ] ifNone: [  ]