fixups
fixReversedValueMessages
	"ar 3/18/2001: Due to the change in the ordering of the value parameter old event handlers may have messages that need to be fixed up. Do this here."

	self replaceSendsIn: #( renameCharAction:sourceMorph:requestor: makeGetter:from:forPart: makeSetter:from:forPart: newMakeGetter:from:forPart: newMakeSetter:from:forPart: clickOnLine:evt:envelope: limitHandleMoveEvent:from:index: mouseUpEvent:linkMorph:formData: mouseUpEvent:linkMorph:browserAndUrl: mouseDownEvent:noteMorph:pitch: mouseMoveEvent:noteMorph:pitch: mouseUpEvent:noteMorph:pitch: dragVertex:fromHandle:vertIndex: dropVertex:fromHandle:vertIndex: newVertex:fromHandle:afterVert: prefMenu:rcvr:pref: event:arrow:upDown:
newMakeGetter:from:forMethodInterface:)
			with: #( renameCharAction:event:sourceMorph: makeGetter:event:from: makeSetter:event:from: newMakeGetter:event:from: newMakeSetter:event:from: clickOn:evt:from: limitHandleMove:event:from: mouseUpFormData:event:linkMorph: mouseUpBrowserAndUrl:event:linkMorph: mouseDownPitch:event:noteMorph: mouseMovePitch:event:noteMorph: mouseUpPitch:event:noteMorph: dragVertex:event:fromHandle: dropVertex:event:fromHandle: newVertex:event:fromHandle: prefMenu:event:rcvr: upDown:event:arrow: makeUniversalTilesGetter:event:from:).

"sw 3/28/2001 extended Andreas's original lists by one item"