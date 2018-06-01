WiW support
installAsActiveSubprojectIn: enclosingWorld titled: aString

    | opt newWidth |

    opt := self optimumExtentFromAuthor.
    (opt x > (enclosingWorld width * 0.7) or: 
            [opt y > (enclosingWorld height * 0.7)]) ifTrue: [
        newWidth := enclosingWorld width // 2.
        opt := newWidth @ (opt y * newWidth / opt x) truncated
    ].
    ^self 
        installAsActiveSubprojectIn: enclosingWorld 
        at: (enclosingWorld topLeft + (enclosingWorld extent - opt // 2) extent: opt) 
        titled: aString