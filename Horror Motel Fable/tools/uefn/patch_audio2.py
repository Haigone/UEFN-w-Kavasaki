import sys
p = sys.argv[1]
t = open(p, encoding='utf-8').read()


def rep(a, b, n=1):
    global t
    assert t.count(a) == n, (t.count(a), a[:80])
    t = t.replace(a, b)


NEW = ['Rain', 'Fluor', 'CRT', 'Generator', 'Breaker', 'GuestBreath', 'Whisper', 'Page', 'Keypad', 'Door']
ed = ''.join('    @editable Aud_%s:audio_player_device = audio_player_device{}\n' % n for n in NEW)
rep("    @editable Aud_Heartbeat:audio_player_device = audio_player_device{}\n",
    "    @editable Aud_Heartbeat:audio_player_device = audio_player_device{}\n" + ed)
# beds
rep("    AudioStart():void =\n        Aud_Wind.Play()\n        Aud_Neon.Play()\n",
    "    AudioStart():void =\n        Aud_Wind.Play()\n        Aud_Neon.Play()\n        Aud_Rain.Play()\n        Aud_Fluor.Play()\n        Aud_CRT.Play()\n")
# power restore: breaker lever + generator idle
rep("                    Aud_Power.Play()\n                    ToastAll(\"POWER RESTORED\")",
    "                    Aud_Power.Play()\n                    Aud_Breaker.Play()\n                    Aud_Generator.Play()\n                    ToastAll(\"POWER RESTORED\")")
# reveal whispers
rep("        Aud_Reveal.Play()\n        ReaderAll(Room13Photo(1986), 9.0)",
    "        Aud_Reveal.Play()\n        Aud_Whisper.Play()\n        ReaderAll(Room13Photo(1986), 9.0)")
# per-player page turn whenever a document opens
rep("            set D.ReaderSerial += 1\n            H.ReaderText.SetText(M(S))",
    "            set D.ReaderSerial += 1\n            Aud_Page.Play(Pl)\n            H.ReaderText.SetText(M(S))")
# keypad dial clicks
rep("    ShowDials(Pl:player):void =\n",
    "    ShowDials(Pl:player):void =\n        Aud_Keypad.Play()\n")
# door: move the one-shot emitter to the door, then play
rep("    OpenDoor(I:int):void =\n        if (D := AllDoors()[I]):\n            D.Hide()",
    "    OpenDoor(I:int):void =\n        if (D := AllDoors()[I]):\n            if (Aud_Door.TeleportTo[D.GetTransform().Translation, IdentityRotation()]) {}\n            Aud_Door.Play()\n            D.Hide()")
# guest breathing follows the (visible) Guest; the audio emitter is invisible, so moving it is not an NPC teleport
rep("            if (GuestProp.TeleportTo[Start, IdentityRotation()]) {}\n            GuestProp.Show()\n",
    "            if (GuestProp.TeleportTo[Start, IdentityRotation()]) {}\n            GuestProp.Show()\n"
    "            if (Aud_GuestBreath.TeleportTo[Start + vector3{X := 0.0, Y := 0.0, Z := 180.0}, IdentityRotation()]) {}\n"
    "            Aud_GuestBreath.Play()\n")
rep("        set GuestPos = NewPos\n        GuestProp.MoveTo(",
    "        set GuestPos = NewPos\n        if (Aud_GuestBreath.TeleportTo[NewPos + vector3{X := 0.0, Y := 0.0, Z := 180.0}, IdentityRotation()]) {}\n        GuestProp.MoveTo(")
rep("        set GuestActive = false\n        GuestProp.Hide()\n",
    "        set GuestActive = false\n        GuestProp.Hide()\n        Aud_GuestBreath.Stop()\n", 2)
open(p, 'w', encoding='utf-8', newline='\n').write(t)
print('patched')
