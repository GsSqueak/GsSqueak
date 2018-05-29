scroll bar events
xScrollBarValue: scrollValue 

	"although there appear to be no senders, see Slider>>setValue:"

	scroller hasSubmorphs ifFalse: [^ self].
	scroller offset: self leftoverScrollRange x * scrollValue @ scroller offset y