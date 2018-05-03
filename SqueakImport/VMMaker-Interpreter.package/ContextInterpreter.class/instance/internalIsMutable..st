object format
internalIsMutable: oop
	<inline: true>
	<export: true>
	^true
	"^((self baseHeader: oop) bitAnd: ImmutabilityBit) = 0"