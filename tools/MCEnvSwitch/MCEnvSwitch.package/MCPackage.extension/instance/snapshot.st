*MCEnvSwitch
snapshot
  | packageInfo definitions categories |
  packageInfo := self packageInfo.
  packageInfo class == PackageInfo
    ifFalse: [ 
      "subclasses are not likely to function correctly with PackageInfo>>coreMethods:extensionMethods:overriddenMethods:classes:.
       Use the old snapshot code"
      ^ self snapshotOld ].
  definitions := OrderedCollection new.
  categories := packageInfo systemCategories.
  categories isEmpty
    ifFalse: [ definitions add: (MCOrganizationDefinition categories: categories) ].
  packageInfo
    env: MCEnv current
    coreMethods: [ :ea | definitions add: ea asMethodDefinition ]
    extensionMethods: [ :ea | definitions add: ea asMethodDefinition ]
    overriddenMethods: [ :ea | 
      definitions
        add:
          (packageInfo changeRecordForOverriddenMethod: ea) asMethodDefinition ]
    classes: [ :ea | definitions addAll: ea classDefinitions ].
  ^ MCSnapshot fromDefinitions: definitions