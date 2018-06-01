as yet unclassified
testWordSubclass
| class |
  Object
    newMethodFromSqueakString:
      'foo
^ Magnitude variableWordSubclass: ''SubclassName'' instanceVariableNames: '''' classVariableNames: ''asdf'' poolDictionaries: '''' category: ''myCat'' '
    inEnv: 7.
  Object new @env7: foo.
class := (SqueakEnvironment at: #'SubclassName' ifAbsent: [nil]).
self convenienceTestForClass: class.


self assert: class @env7: isVariable.
self deny: class @env7: isBytes.
self assert: class @env7: isWords.
self deny: class @env7: isLongs.
self deny: class @env7: isShorts.

