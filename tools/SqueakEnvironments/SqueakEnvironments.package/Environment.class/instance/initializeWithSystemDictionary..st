initialize-release
initializeWithSystemDictionary: old
  | squeakSmalltalk |
  self initialize.
  info := EnvironmentInfo
    name: 'Smalltalk'
    organization: old organization
    packages: PackageOrganizer default.
  old associationsDo: [ :assc | declarations add: assc ].
  (old at: #'Undeclared') associationsDo: [ :assc | undeclared add: assc ].
  UserGlobals at: #'SqueakEnvironment' put: self.
  squeakSmalltalk := SmalltalkImage new.
  declarations at: #'Smalltalk' put: squeakSmalltalk.
  squeakSmalltalk globals: self.
  declarations at: #'Undeclared' put: undeclared