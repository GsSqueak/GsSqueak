*SqueakParser
newSqueakMethodFrom: aString
  ^ self
    newMethodFromSqueakString: aString
    inEnv: 7
    classified: #'as yet unclassified'
