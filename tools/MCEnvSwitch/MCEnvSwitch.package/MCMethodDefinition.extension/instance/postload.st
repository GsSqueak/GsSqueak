*MCEnvSwitch
postload
  self isInitializer
    ifTrue: [ 
      (MCPerformPostloadNotification new postloadClass: self actualClass) signal
        ifTrue: [ self actualClass theNonMetaClass perform: #'initialize' env: MCEnv current ] ]