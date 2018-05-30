events-processing
mouseDownPriority
	"Return the default mouse down priority for the receiver. This supports a morph to get mouse down before one of its children."

	^ self
		valueOfProperty: #mouseDownPriority
		ifAbsent: [(self isPartsDonor or: [self isPartsBin])
			ifTrue:	[50]
			ifFalse:	[0]].
		
	"The above is a workaround for the complete confusion between parts donors and parts bins. Morphs residing in a parts bin may or may not have the parts donor property set; if they have they may or may not actually handle events. To work around this, parts bins get an equal priority to parts donors so that when a morph in the parts bin does have the property set but does not handle the event we still get a copy from picking it up through the parts bin. Argh. This just *cries* for a cleanup."
	"And the above comment is Andreas's from 10/2000, which was formerly retrievable by a #flag: call which however caused a problem when trying to recompile the method from decompiled source."