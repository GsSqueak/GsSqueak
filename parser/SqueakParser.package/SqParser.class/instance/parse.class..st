public access
parse: sourceStreamOrString class: behavior
  | methodNode |
  methodNode := self
    parse: sourceStreamOrString readStream
    class: behavior
    noPattern: false
    notifying: nil
    ifFail: [ self halt ].
  methodNode class: behavior.
  ^ methodNode