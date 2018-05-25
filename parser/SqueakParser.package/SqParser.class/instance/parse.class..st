public access
parse: sourceStreamOrString class: behavior
  | methodNode |
  methodNode := self
    parse: sourceStreamOrString readStream
    class: behavior
    noPattern: false
    notifying: nil
    ifFail: [ self error: 'Could not parse source' ].
  methodNode class: behavior.
  ^ methodNode
