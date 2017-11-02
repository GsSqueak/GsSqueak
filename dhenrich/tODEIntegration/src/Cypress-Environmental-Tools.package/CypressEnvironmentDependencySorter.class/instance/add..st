building
add: aPatchOperation
  | requirements |
  requirements := self unresolvedRequirementsFor: aPatchOperation.
  requirements removeIfPresent: 'nil'.
  requirements removeIfPresent: nil.
  requirements isEmpty
    ifTrue: [ self addToOrder: aPatchOperation ]
    ifFalse: [ self addRequirements: requirements for: aPatchOperation ].
  ^ aPatchOperation