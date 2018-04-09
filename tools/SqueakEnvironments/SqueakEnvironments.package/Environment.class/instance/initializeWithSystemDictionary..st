initialize-release
initializeWithSystemDictionary: old
  | squeakSmalltalk |
  self initialize.
  info := EnvironmentInfo
    name: 'Smalltalk'
    organization: old organization
    packages: PackageOrganizer default.
  UserGlobals at: #'SqueakEnvironment' put: self.
  squeakSmalltalk := SmalltalkImage new.
  self at: #'Smalltalk' put: squeakSmalltalk.
  self at: #'Undeclared' put: undeclared.
  squeakSmalltalk globals: self.
  self importSelf