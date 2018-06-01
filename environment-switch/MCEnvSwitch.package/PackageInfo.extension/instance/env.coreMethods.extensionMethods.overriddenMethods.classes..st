*MCEnvSwitch
env: envId coreMethods: coreMethodBlock extensionMethods: extensionMethodBlock overriddenMethods: overriddenMethodBlock classes: classesBlock
  "optimization for doing a snapshot"

  | myBehaviors myClasses |
  myBehaviors := IdentitySet new.
  myClasses := IdentitySet new.
  self systemCategories
    do: [ :cat | 
      (SystemOrganizer new listClassesAtCategoryNamed: cat)
        do: [ :cl | 
          myClasses add: cl.
          myBehaviors
            add: cl;
            add: cl class ] ].
  myBehaviors
    do: [ :beh | 
      (self env: envId coreMethodsForClass: beh)
        do: [ :m | 
          (m isValid and: [ (#(#'DoIt' #'DoItIn:') includes: m methodSymbol) not ])
            ifTrue: [ coreMethodBlock value: m ] ] ].
  MCPlatformSupport
    allBehaviorsDo: [ :beh | 
      | isExtensionBehavior |
      isExtensionBehavior := (myBehaviors includes: beh) not.
      beh
        env: envId
        unifiedCategoriesDo: [ :cat :selectors | 
          (self isOverrideCategory: cat)
            ifTrue: [ 
              selectors
                do: [ :sel | 
                  | m |
                  m := self
                    referenceForMethod: sel
                    ofClass: beh
                    environmentId: envId.
                  (self isOverrideOfYourMethod: m)
                    ifTrue: [ overriddenMethodBlock value: m ] ] ].
          isExtensionBehavior
            ifTrue: [ 
              (self isYourClassExtension: cat)
                ifTrue: [ 
                  selectors
                    do: [ :sel | 
                      | m |
                      m := self
                        referenceForMethod: sel
                        ofClass: beh
                        environmentId: envId.
                      (m isValid
                        and: [ (#(#'DoIt' #'DoItIn:') includes: m methodSymbol) not ])
                        ifTrue: [ extensionMethodBlock value: m ] ] ] ] ] ].
  myClasses do: classesBlock