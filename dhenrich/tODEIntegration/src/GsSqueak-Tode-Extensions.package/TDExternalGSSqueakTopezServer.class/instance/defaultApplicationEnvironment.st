environment
defaultApplicationEnvironment
  self todeUserId ifNil: [ ^ self defaultTodeEnvironment ].
  ^ TDCustomGsSqueakEnvironment new