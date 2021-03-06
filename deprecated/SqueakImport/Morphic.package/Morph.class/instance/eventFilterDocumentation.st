events-filtering
eventFilterDocumentation
	"
	Event filters represent a mechanism to intercept events *before* morphs get the chance to handle them. So, there are still event handlers, which are usually the morphs themselves. However, morphs can also be their own event filters. One application of event filters is keyboard shortcuts. Such filters should invoke the shortcut but ignore the original event to *be sure* that no other morph ever handles that. System windows have window shortcuts. The world has world shortcuts.
	
	When user input events are dispatched, there is a capturing phase and a bubbling phase. This dispatching behavior is described in MorphicEventDispatcher. Capturing means that we are looking for the handler (resp. morph) to handle the event, traversing submorph hierarchy. Bubbling means that once a morph handled the event, all owners get also the chance to handle that event *if* they honor the #wasHandled flag.. Event filters can be attached to any morph for the capturing or the bubbling phase. See it as code that is execute before/after the event handlers.
	
	Event filters are objects that implement #filterEvent:for:. All objects understand that message but do nothing. There is a PluggableEventFilter for a more dynamic programming approach.
	
	Morphic hands have specific focus holders. There is a keyboard focus and a mouse focus. For example, text morphs are good candidates for holders of the keyboard focus. Both foci bypass the traditional event capturing phase, which usually start at the world morph. However, capture filters are also apply before handling the focus event. See Morph >> #handleFocusEvent: for that. Note that after handling the focus event, events do bubble along their owners, which usually do nothing if they honor the #wasHandled flag, and hence all bubble event filters are executed unless events get ignored. Thus, we mimick the behavior of MorphicEventDispatcher in #handleFocusEvent:.
	
	There are event filters for all kinds of events, filters for keyboard events, and filters for mouse events. You can always install generic event filters and then check for the particular event type in that filter. However, it is good style to not install keyboard event filters as generic event filters. It makes code more readable.
	
	You can install global event capture filters in instances of HandMorph. For example,  Project current world firstHand provides access to the project's world's hand. Avoid using globals such as ActiveHand or ActiveWorld. BEWARE that global event filters can have unexpected effects and may be difficult to debug. Note that you cannot install global event bubble filters in the HandMorph. You have to install such a filter in the world because hands are not part of the event bubbling phase.
	
	For an example of keyboard capturing filters see SystemWindow >> #addKeyboardShortcuts and SystemWindow >> #filterEvent:for:. You can also take a look at: PasteUpMorph >> #addKeyboardShortcuts and PasteUpMorph >> #filterEvent:for: and DockingBarMorph >> #filterEvent:for: for a more elaborate example.
	
	Event filters include all the behavior of event listeners. An event listener converted to an event filter would be a global event capture filter that sents a copy of the event to itself:
	
	| listenerFilter someMorph |
	someMorph := Morph new.
	listenerFilter := PluggableEventFilter on: [:event :target | event copy sentTo: someMorph. event].
	Project current world activeHand addEventCaptureFilter: listenerFilter.
	
	Instead of:

	| someMorph |
	someMorph := Morph new.
	Project current world activeHand addEventListener: someMorph.
	
	The filter version might look more complicated than the traditional listener version but note that it is quite rare to install global event filters. The example for keyboard shortcuts reflects the simplicity of event filters."