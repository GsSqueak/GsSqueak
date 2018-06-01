*MCEnvSwitch
env: envId methodsInCategory: aString ofClass: aClass
  ^ ((aClass selectorsIn: aString environmentId: envId) ifNil: [ #() ])
    collect: [ :sel | self referenceForMethod: sel ofClass: aClass environmentId: envId ]