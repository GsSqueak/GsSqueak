class initialization
deferredUIMessages
  ^ DeferredUIMessages ifNil: [ DeferredUIMessages := TransientSharedQueue new ]