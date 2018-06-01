as yet unclassified
respondFor: symbol

 | class |

Transcript show: 'Request for ', symbol.
class := Smalltalk at: symbol ifAbsent: [nil].
class ifNotNil: [
				self respondForClass: class]