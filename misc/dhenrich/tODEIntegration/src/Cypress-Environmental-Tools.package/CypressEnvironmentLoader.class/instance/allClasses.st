accessing
allClasses
  | classes |
  classes := Array new.
  self defaultSymbolList
    do: [ :dict | classes addAll: (dict select: [ :each | each isBehavior ]) ].
  ^ classes