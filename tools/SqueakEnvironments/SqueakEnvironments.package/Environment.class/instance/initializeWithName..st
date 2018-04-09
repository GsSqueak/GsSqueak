initialize-release
initializeWithName: aString
  | _gsSqueakTemp_smalltalk |
  self initialize.
  info := EnvironmentInfo name: aString.
  _gsSqueakTemp_smalltalk := SmalltalkImage basicNew.
  _gsSqueakTemp_smalltalk globals: self.
  declarations at: #'Smalltalk' put: _gsSqueakTemp_smalltalk.
  declarations at: #'Undeclared' put: undeclared.
  self initializeCommons