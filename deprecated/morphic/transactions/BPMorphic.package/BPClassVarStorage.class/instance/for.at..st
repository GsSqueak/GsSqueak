as yet unclassified
for: aClass at: aVarName
  ^ (self _classDictFor: aClass) at: aVarName ifAbsent: [ nil ]