# THE MOTEL: ROOM 13 - canonical player-facing copy.
# Source of truth: NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md (NCP-01) and UI_STRING_TABLE.csv. Do not rewrite.
# Long passages are pre-wrapped because the HUD panel does not rely on automatic wrapping.

motel_text<public> := module:

    M<public><localizes>(S:string):message = "{S}"

    ObjTitle<public>(N:int):string =
        case (N):
            1 => "REACH THE MOTEL"
            2 => "OPEN THE FRONT DESK"
            3 => "FIND THE WAY UPSTAIRS"
            4 => "RESTORE THE POWER"
            5 => "FIND ROOM 13"
            6 => "DISCOVER THE OWNER'S IDENTITY"
            7 => "OPEN THE SERVICE ROUTE"
            _ => "DECIDE THE MOTEL'S FATE"

    ObjBody<public>(N:int):string =
        case (N):
            1 => "Follow the neon sign to reception."
            2 => "Read the register and enter its date code."
            3 => "Enter the owner's office and solve the photo board."
            4 => "Find three fuses, match their labels and activate the breaker."
            5 => "Reach the upper floor and open the concealed panel in Room 12."
            6 => "Arrange the four photographs and uncover the hidden compartment."
            7 => "Unlock the service control; find the car keys if you choose to escape."
            _ => "Choose what happens to the motel."

    Register<public>:string = "RAVEN MOTEL - NIGHT REGISTER\nThursday, February 13, 1986\n\nRoom 02 | E. Mercer | 8:06 PM | One suitcase. Asked for a flashlight.\nRoom 07 | H. Doyle  | 9:14 PM | Paid cash. No vehicle listed.\nRoom 11 | M. Vale   | 10:02 PM | Requested a room away from the stairs.\nRoom 13 | RESERVED  | 2:13 AM | No key issued. Do not enter.\n\nHandwritten desk note:\n\"First occupied room. Night of the month.\nLast two digits of the year. In that order.\""

    PhoneWelcome<public>:string = "\"Welcome. We've been expecting you.\""

    OfficePhoto<public>(Year:int):string =
        case (Year):
            1974 => "1974 - THE FIRST SUMMER: the owner stands beside the newly painted\nRAVEN MOTEL sign; twelve room markers are visible."
            1978 => "1978 - THE NEW WING: the owner cuts a ribbon at the upper balcony;\na background figure has the owner's face."
            1982 => "1982 - STAFF PORTRAIT: the owner sits alone at reception;\nthe wall clock reads 02:13."
            _ => "1986 - CLOSING NIGHT: reception is empty; a ROOM 13 key lies on the counter;\nthe owner appears only as a reflection in the dark window."

    Room13Photo<public>(Year:int):string =
        case (Year):
            1968 => "1968 - THE OWNER, BEFORE THE MOTEL: a young man in a roadside uniform\nbeside a highway sign; his face matches the ROOM 13 portrait.\nBack: \"Before there was a room, there was a promise.\""
            1974 => "1974 - OPENING DAY: the same man at the Raven Motel entrance;\ntwelve room keys hang behind him.\nBack: \"Twelve rooms for the road.\""
            1981 => "1981 - THE LAST STAFF PHOTO: the man alone in reception; clock reads 02:13;\na shadow behind him has THE GUEST's outline.\nBack: \"The night stopped at 2:13.\""
            _ => "1986 - NO VACANCY: the owner stands in a doorway absent from every floor plan;\nhis reflection is THE GUEST.\nBack: \"The thirteenth room was never built. It was kept.\""

    FuseTagA<public>:string = "\"A - FRONT DESK CIRCUIT. Spare fuse. Return to the utility panel.\""
    FuseTagB<public>:string = "\"B - HALL / BALCONY CIRCUIT. Keep dry.\""
    FuseTagC<public>:string = "\"C - SERVICE CIRCUIT. Maintenance stock.\""

    Room04Transcript<public>:string = "ROOM 04 - TELEPHONE RECORDING (night clerk, 1986)\n\n\"If you're hearing this, the lights have gone again.\nThe spare marked A is with the guest's flashlight.\nB is on the storage shelf by the wet-floor sign.\nC is in the maintenance cabinet in Six.\nMatch the letters. Don't force a fuse into the wrong socket.\nAnd if the clock says two thirteen... don't answer the phone.\""

    Room06Archive<public>:string = "ROOM 06 - MISSING GUEST PHOTOGRAPHS\n\n1968 - M. HARROW, FIRST DISAPPEARANCE: a young roadside motel clerk stands beside\nan empty lot where the Raven Motel will later stand; the rain-streaked bus-shelter\nglass reflects the future motel and the same face seen in the ROOM 13 owner portrait.\n1974 - THE VALE PARTY: three guests pose by the courtyard; one face is scratched out;\nthe same figure appears in an upper-balcony reflection.\n1981 - NIGHT AUDIT: empty reception at 02:13; the register reads\n\"NO CHECK-OUT RECORDED\".\n1986 - CLOSING NIGHT: guests stand at the entrance; the owner is absent from the group\nbut appears behind them in the glass.\n\nBack-of-frame note: \"The first name was written before the first room.\nNone was checked out.\""

    DiaryA<public>:string = "PRIVATE - NIGHT MANAGER'S LOG  (12-13 February 1986)\n\n12 FEBRUARY - 11:40 PM\nThe owner came through the lobby again. I heard the front door, then the desk bell,\nbut the rain never stopped and the glass never moved. He asked whether the register\nwas ready. I told him there were no guests. He said the register disagreed.\n\n13 FEBRUARY - 12:05 AM\nThere are twelve rooms on the plans. I checked every wall myself. The owner says the\nthirteenth room is not on the plans because it is not meant for guests.\nThen why is there a key on the rack?\n\n13 FEBRUARY - 1:17 AM\nA woman came downstairs carrying a suitcase. She asked me to call her family.\nThe telephone rang before I touched it. When I picked up, I heard my own voice\ntelling her to go back upstairs.\n\n(interact again to continue)"

    DiaryB<public>:string = "13 FEBRUARY - 2:13 AM\nThe clock stopped. The owner was standing at the far end of the corridor.\nI could see his face clearly. Then the lights flickered and the thing at the end\nof the corridor was still wearing it.\n\n13 FEBRUARY - 2:14 AM\nI locked the office. The register is open on the desk. There is a new line in the book.\nMy handwriting. I do not remember writing it.\n\n13 FEBRUARY - NO TIME\nIf someone finds this, do not trust a room number just because it is printed on a door.\nThe room is where the motel keeps what it cannot check out."

    ChildDrawing<public>:string = "A CHILD'S DRAWING\n\nA U-shaped motel around a black courtyard. Twelve small windows surround it.\nA thirteenth window floats above the roofline, with a tall stick figure behind it.\nThe figure wears the same round lapel pin as the owner in the office photographs.\n\n\"HE IS IN EVERY ROOM. THE ONE WITH NO DOOR IS HIS.\"\n\nBack of paper: \"13 / 2:13\" in crayon."

    TruthRecorder<public>:string = "NIGHT-AUDIT RECORDER\n\n\"The clock stopped. The owner was standing at the far end of the corridor.\nI could see his face clearly. Then the lights flickered and the thing at the end\nof the corridor was still wearing it.\"\n\nHold the breaker marked NIGHT AUDIT - END CYCLE."

    TruthPrint<public>:string = "The register prints:\n\nNO VACANCY. NO OWNER. NO GUEST."

    NewGuestInvite<public>:string = "THE ROOM IS READY.\nThe night can begin again.\nSomeone must keep the light on.\nWill you stay?\n\nACCEPT THE ROOM   /   LEAVE THE KEY"

    EscapeRadio<public>:string = "\"Thank you for staying at the Raven Motel.\nWe hope to see you again soon.\""
