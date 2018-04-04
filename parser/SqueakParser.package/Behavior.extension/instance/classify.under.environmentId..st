*SqueakParser
classify: methodSelector under: aCategory environmentId: envId
  (self categoryOfSelector: methodSelector environmentId: envId) = aCategory
    ifTrue: [ ^ self ].
  (self includesCategory: aCategory environmentId: envId)
    ifFalse: [ self addCategory: aCategory environmentId: envId ].
  self moveMethod: methodSelector toCategory: aCategory environmentId: envId