enter
enterAsActiveSubprojectWithin: enclosingWorld

    "Install my ChangeSet, Transcript, and scheduled views as current globals. 

    If returningFlag is true, we will return to the project from whence the current project was entered; don't change its previousProject link in this case.
    If saveForRevert is true, save the ImageSegment of the project being left.
    If revertFlag is true, make stubs for the world of the project being left.
    If revertWithoutAsking is true in the project being left, then always revert."

    "Experimental mods for initial multi-project work:
        1. assume in morphic (this eliminated need for <showZoom>)
        2. assume <saveForRevert> is false (usual case) - removed <old>
        3. assume <revertFlag> is false
        4. assume <revertWithoutAsking> is false - <forceRevert> now auto false <seg> n.u.
        5. no zooming
        6. assume <projectsSentToDisk> false - could be dangerous here
        7. assume no isolation problems (isolationHead ==)
        8. no closing scripts
    "

    self isCurrentProject ifTrue: [^ self].

    "guards ifNotNil: [
        guards := guards reject: [:obj | obj isNil].
        guards do: [:obj | obj okayToEnterProject ifFalse: [^ self]]
    ]."

        "CurrentProject makeThumbnail."
        "--> Display bestGuessOfCurrentWorld triggerClosingScripts."
    CurrentProject displayDepth: Display depth.

    displayDepth == nil ifTrue: [displayDepth := Display depth].
        "Display newDepthNoRestore: displayDepth."

        "(world hasProperty: #letTheMusicPlay)
            ifTrue: [world removeProperty: #letTheMusicPlay]
            ifFalse: [Smalltalk at: #ScorePlayer ifPresent: [:playerClass | 
                        playerClass allSubInstancesDo: [:player | player pause]]]."

        "returningFlag
            ifTrue: [nextProject := CurrentProject]
            ifFalse: [previousProject := CurrentProject]."

        "CurrentProject saveState."
        "CurrentProject := self."
        "Smalltalk newChanges: changeSet."
        "TranscriptStream newTranscript: transcript."
        "Sensor flushKeyboard."
        "recorderOrNil := Display pauseMorphicEventRecorder."

        "Display changeMorphicWorldTo: world."  "Signifies Morphic"
    world 
        installAsActiveSubprojectIn: enclosingWorld 
        titled: self name.

        "recorderOrNil ifNotNil: [recorderOrNil resumeIn: world]."
    world triggerOpeningScripts.
    self removeParameter: #exportState.
        "self spawnNewProcessAndTerminateOld: true"