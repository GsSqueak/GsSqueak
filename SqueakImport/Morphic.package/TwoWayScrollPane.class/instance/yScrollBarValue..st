scroll bar events
yScrollBarValue: scrollValue

	"although there appear to be no senders, see Slider>>setValue:"

	scroller hasSubmorphs ifFalse: [^ self].
	scroller offset: scroller offset x @ (self leftoverScrollRange y * scrollValue)