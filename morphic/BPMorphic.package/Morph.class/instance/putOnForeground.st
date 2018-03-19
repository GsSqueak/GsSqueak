-Etoys
putOnForeground
	"Place the receiver, formerly on the background, onto the foreground.
	If the receiver needs data carried on its behalf by the card, those data
	will be lost, so in this case get user confirmation before proceeding."
	self holdsSeparateDataForEachInstance
		ifTrue: ["later add the refinement of not putting up the following
			confirmer if only a single instance of the current background's
			uniclass exists"
			self
				confirm: 'Caution -- every card of this background
formerly had its own value for this
item.  If you put it on the foreground,
the values  of this item on all other
cards will be lost' translated
				orCancel: [^ self]].
	self removeProperty: #shared.
	self stack reassessBackgroundShape