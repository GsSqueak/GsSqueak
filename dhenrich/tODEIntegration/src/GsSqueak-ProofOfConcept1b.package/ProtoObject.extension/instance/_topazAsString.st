Formatting
_topazAsString
  ^ [ self asString ]
    onSynchronous: AbstractException
    do: [ :ex | '<error during asString>' ]

