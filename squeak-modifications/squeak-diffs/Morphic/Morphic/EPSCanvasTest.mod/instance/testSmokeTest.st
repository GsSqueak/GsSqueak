as yet unclassified
testSmokeTest
| epsCode |
epsCode := (RectangleMorph new asEPS).

self assert: epsCode lines first = '%!PS-Adobe-2.0 EPSF-2.0'.

self assert: (epsCode lines detect: [:line | line beginsWith: '%start morph:  a RectangleMorph'] ifNone: [nil]) notNil.

self assert: epsCode lines last = '%%EOF'
