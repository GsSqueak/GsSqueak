-services-base
requestor
  ^ self owner ifNil: [ super requestor ] ifNotNil: [ self owner requestor ]