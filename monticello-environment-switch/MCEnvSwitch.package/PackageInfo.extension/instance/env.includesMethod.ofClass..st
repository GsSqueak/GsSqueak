*MCEnvSwitch
env: envId includesMethod: aSymbol ofClass: aClass
  aClass ifNil: [ ^ false ].
  ^ self
    includesMethodCategory:
      ((aClass categoryOfSelector: aSymbol environmentId: envId) ifNil: [ ' ' ])
    ofClass: aClass