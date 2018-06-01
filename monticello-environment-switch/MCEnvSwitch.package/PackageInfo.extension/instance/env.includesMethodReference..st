*MCEnvSwitch
env: envId includesMethodReference: aMethodRef
  ^ self
    env: envId
    includesMethod: aMethodRef methodSymbol
    ofClass: aMethodRef actualClass