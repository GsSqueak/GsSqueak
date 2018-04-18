*SqueakParser
setCompileEnv: anInt
  | mask |
  mask := Env_mask.
  (anInt < 0 or: [ anInt > mask ])
    ifTrue: [ ArgumentError signal: 'invalid environment ID' ].
  rubyInfo := (rubyInfo bitAnd: mask bitInvert) bitOr: anInt