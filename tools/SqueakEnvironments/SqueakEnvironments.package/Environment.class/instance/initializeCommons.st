initialize-release
initializeCommons
  self at: #'SmalltalkImage' put: SmalltalkImage.
  self at: #'SmallInteger' put: SmallInteger.
  self at: #'LargeInteger' put: LargeInteger.
  self at: #'Float' put: Float.
  self at: #'ScaledDecimal' put: ScaledDecimal.
  self at: #'Object' put: Object.
  self at: #'Class' put: Class.
  self at: #'Behavior' put: Behavior.
  self at: #'Character' put: Character.
  self at: #'ByteArray' put: ByteArray.
  self at: #'Array' put: Array.
  self at: #'Boolean' put: Boolean.
  self at: #'Metaclass' put: Metaclass3.
  self at: #'Metaclass3' put: Metaclass3.
  self at: #'BlockClosure' put: BlockClosure.
  self at: #'UndefinedObject' put: UndefinedObject.
  self at: #'ByteString' put: String.
  self at: #'Context' put: Context.  
  self at: #'DoubleByteString' put: DoubleByteString.
  self at: #'QuadByteString' put: QuadByteString.
  self at: #'ByteSymbol' put: Symbol.
  self at: #'DoubleByteSymbol' put: DoubleByteSymbol.
  self at: #'QuadByteSymbol' put: QuadByteSymbol.
