accessing
blockVars
  ^ blockVars ifNil: [ blockVars := IdentityDictionary new ]