initialization
initialize
    SystemOrganization := SystemOrganizer
        defaultList: (Smalltalk globals allClasses collect: [ :each |
            each name asSymbol ]).
    Smalltalk globals info
        initializeWithName: #Smalltalk
        organization: SystemOrganization
        packages: Dictionary new.
