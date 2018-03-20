public access
parse: sourceStreamOrString class: behavior
  | methodNode |
  methodNode := self
    parse: sourceStreamOrString readStream
    class: behavior
    noPattern: false
    notifying: nil
    ifFail: [ ^ nil ].
  methodNode class: behavior.
  ^ methodNode