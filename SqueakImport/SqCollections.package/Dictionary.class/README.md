A Dictionary is an unordered collection of values which are indexed by arbitrary keys.
A Dictionary is accessed via #at: and #at:put: messages like a SequenceableCollection, but instead of being Integer, the keys can be any object that responds to =.
		
The = message is used to test for the existence of the key in the Dictionary.
If the key is absent, #at:put: adds a new entry to the Dictionary.

	(Dictionary new)
		at: 'foo' put: 1;
		at: 'bar' put: 8;
		yourself.

Each key is unique: storing another value with #at:put: at an already used key overwrites previously associated value.

	(Dictionary new)
		at: 'bar' put: 4;
		at: 'bar' put: 8;
		at: 'bar'.
		
The values are not necessarily unique, thus a Dictionary can also be seen as a sort of Bag with this respect.

	(Dictionary new)
		at: 'foo' put: 8;
		at: 'bar' put: 8;
		yourself.

If the key is absent, #at: raises an Error. An alternate block of code can be executed and its value returned in this case using #at:ifAbsent:.
See also #at:ifAbsentPut:.

	(Dictionary new) at: 'foo' ifAbsent: [nil].

Dictionary is implemented as a HashedCollection of Association (a value is associated to its key et vice et versa).
Being a HashedCollection enables fast random access indexed by keys.
Consequently, keys must respond to #hash (see super).

BEWARE: as for every HashedCollection, it is better to not modify an object after it is used as a Dictionary key. The reason is that this might change the #hash code, making the Dictionary unable to find corresponding entry, or make two keys equal violating uniqueness. It's progammer responsibility to take care to not modify the keys, or eventually to send #rehash to the Dictionary if they ever happen to change.

It is possible to grow or shrink a Dictionary using the messages #add: and #remove: with an Association parameter, however the prefered way to do so is using #at:put: and #removeKey:.
BEWARE: as for super, space reserved in internal storage array can grow but never shrink.

For conveniency, it is also possible to create a Dictionary out of a Collection of associations, as for example in:

    {'foo' -> 1. 'bar' -> 8} as: Dictionary.
    Dictionary withAll: {'foo' -> 1. 'bar' -> 8}.
    Dictionary new addAll: {'foo' -> 1. 'bar' -> 8}; yourself.

BEWARE: though a Sequence collection can be considered as a sequence of values with Integer keys (see #keysAndValuesDo: ), it cannot be converted into a Dictionary using these keys, and following message will fail:

	#('foo' 'bar') as: Dictionary.

Enumerating a Dictionary with #do: will only enumerate the values, not the keys.
Remember, the order of evaluation is arbitrary and can change when you grow or shrink a Dictionary.

    ({'foo' -> 1. 'bar' -> 8} as: Dictionary) do: [:each | Transcript cr; show: each printString].

For enumerating keys and values, use #keysAndValuesDo:, or use #associationsDo: to enumerate the associations.
#select: #reject: #collect: will operate on values while preserving the keys and thus answer a new Dictionary.

    ({'foo' -> 1. 'bar' -> 8} as: Dictionary) collect: [:each | each squared].

The keys and values of a Dictionary can be extracted by sending #keys and #values message.
Though the keys are theoretically a Set and values a Bag, for efficiency reasons, these messages will both return an Array of keys
and an Array of values. A neat feature is that these messages are preserving the arbitrary storage order - in other words, (aDictionary values at: 3) is the value associated to key (aDictionary keys at: 3).