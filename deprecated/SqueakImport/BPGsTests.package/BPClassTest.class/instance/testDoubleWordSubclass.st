as yet unclassified
testDoubleWordSubclass
| class |
  Object
    newMethodFromSqueakString:
      'foo
^ Magnitude variableDoubleWordSubclass: ''SubclassName'' instanceVariableNames: '''' classVariableNames: ''asdf'' poolDictionaries: '''' category: ''myCat'' '
    inEnv: 7.
  Object new @env7: foo.
class := (SqueakEnvironment at: #'SubclassName' ifAbsent: [nil]).
self convenienceTestForClass: class.

self assert: class @env7: isVariable.
self deny: class @env7: isBytes.
self deny: class @env7: isWords.
self assert: class @env7: isLongs.
self deny: class @env7: isShorts.

