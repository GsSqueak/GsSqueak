as yet unclassified
testDoubleByteSubclass
| class |
  Object
    newMethodFromSqueakString:
      'foo
^ Magnitude variableDoubleByteSubclass: ''SubclassName'' instanceVariableNames: '''' classVariableNames: ''asdf'' poolDictionaries: '''' category: ''myCat'' '
    inEnv: 7.
  Object new @env7: foo.
class := (SqueakEnvironment at: #'SubclassName' ifAbsent: [nil]).
self convenienceTestForClass: class.

self assert: class @env7: isVariable.
self deny: class @env7: isBytes.
self deny: class @env7: isWords.
self deny: class @env7: isLongs.
self assert: class @env7: isShorts.

