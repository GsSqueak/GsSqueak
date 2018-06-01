*SqClasses-snapshot and quit
isMorphic

    Project current ifNil: [
        ^ false ]
    ifNotNil: [
        ^ Project current isMorphic ]
