menu
selectionMenu: evt

        | menu |
 
        (menu := MenuMorph new)
                addTitle: 'Edit';
                addStayUpItem.

        {
                {'edit separately'. #editSelection}.
                {'copy'. #copySelection}.
                {'cut'. #cutSelection}.
                {'paste'. #pasteSelection}
        } do: [:each |
                menu add: each first
                        target: self
                        selector: each second
                        argumentList: #()].
        menu toggleStayUp: evt.
        menu popUpEvent: evt in: self world