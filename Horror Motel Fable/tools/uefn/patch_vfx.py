import sys
p = sys.argv[1]
t = open(p, encoding='utf-8').read()


def rep(a, b, n=1):
    global t
    assert t.count(a) == n, (t.count(a), a[:80])
    t = t.replace(a, b)


ed = ('    @editable Vfx_Lightning:vfx_spawner_device = vfx_spawner_device{}\n'
      '    @editable Vfx_RevealGhosts:vfx_spawner_device = vfx_spawner_device{}\n'
      '    @editable Vfx_GuestAppear:vfx_spawner_device = vfx_spawner_device{}\n'
      '    @editable Pp_Capture:post_process_device = post_process_device{}\n'
      '    @editable Pp_Reveal:post_process_device = post_process_device{}\n'
      '    @editable Pp_Truth:post_process_device = post_process_device{}\n'
      '    @editable Pp_NewGuest:post_process_device = post_process_device{}\n')
rep("    @editable Aud_Door:audio_player_device = audio_player_device{}\n",
    "    @editable Aud_Door:audio_player_device = audio_player_device{}\n" + ed)
# lightning flash precedes the thunder by a random light-to-sound gap
rep("            if (GameOver?):\n                break\n            Aud_Thunder.Play()",
    "            if (GameOver?):\n                break\n            Vfx_Lightning.Enable()\n            Sleep(GetRandomFloat(0.4, 1.6))\n            Aud_Thunder.Play()")
# capture / release screen tint (per player)
rep("            set D.Captured = true\n            Aud_Capture.Play(Pl)",
    "            set D.Captured = true\n            Aud_Capture.Play(Pl)\n            Pp_Capture.BlendIn(Pl)")
rep("        set D.Captured = false\n        set D.RescueProgress = 0.0",
    "        set D.Captured = false\n        Pp_Capture.BlendOut(Pl)\n        set D.RescueProgress = 0.0")
# Room 13 reveal: spooky grade + ghosts for the 9 s reveal window
rep("        Aud_Whisper.Play()\n",
    "        Aud_Whisper.Play()\n        Pp_Reveal.BlendInForAll()\n        Vfx_RevealGhosts.Enable()\n")
rep("        Sleep(9.0)\n", "        Sleep(9.0)\n        Pp_Reveal.BlendOutForAll()\n        Vfx_RevealGhosts.Disable()\n")
# endings
rep("                ReaderAll(TruthRecorder, 30.0)",
    "                Pp_Truth.BlendInForAll()\n                ReaderAll(TruthRecorder, 30.0)")
rep("    NewGuestSequence()<suspends>:void =\n",
    "    NewGuestSequence()<suspends>:void =\n        Pp_NewGuest.BlendInForAll()\n")
# THE GUEST first appearance: dust burst where it materialises (burst VFX, not the NPC, is moved)
rep("            Aud_GuestBreath.Play()\n",
    "            Aud_GuestBreath.Play()\n            if (Vfx_GuestAppear.TeleportTo[Start, IdentityRotation()]) {}\n            Vfx_GuestAppear.Restart()\n")
open(p, 'w', encoding='utf-8', newline='\n').write(t)
print('patched')
