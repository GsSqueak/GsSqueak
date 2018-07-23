*SqueakParser
newSqueakMethodFrom: aString inEnv: env
  ^ self
    newMethodFromSqueakString: aString
    inEnv: env
    classified: #'as yet unclassified'
