object format
internalIsImmutable: oop
	<inline: true>
	<export: true>
	^false.
	"^((self baseHeader: oop) bitAnd: ImmutabilityBit) ~= 0"