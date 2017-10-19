class creation
installSuperclass: superclass for: aClass environmentId: environmentId
  <primitive: 2001>
  | prot |
  prot := System _protectedMode.
  [ aClass persistentSuperclassForEnv: environmentId put: superclass ]
    ensure: [ prot _leaveProtectedMode ].
  ^ nil