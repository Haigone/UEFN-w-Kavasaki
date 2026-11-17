# Pushes the local Verse sources into the open UEFN Verse project and compiles. Run inside the editor:
#   exec(open(path).read()); print(await push_and_build())
import os, toolset_registry

SRC = r"C:\Users\utente\AppData\Local\Temp\claude\3c5725dd4b11b696\8a0d6a33-3541-4d51-a0c1-4135f1b817d3\scratchpad\uefn_tools\verse"
ROOT = '/1b9a97d9-c7de-416c-b046-aeb97e125690/'

async def push_and_build(build=True):
    out = []
    for fn in sorted(os.listdir(SRC)):
        if fn.endswith('.verse'):
            with open(os.path.join(SRC, fn), encoding='utf-8') as f:
                content = f.read()
            await toolset_registry.execute_tool('VerseToolset.VerseToolset', 'WriteFile',
                                                {'path': ROOT + fn, 'content': content, 'bCreateIfMissing': True})
            out.append('wrote ' + fn)
    if build:
        r = await toolset_registry.execute_tool('VerseToolset.VerseToolset', 'BuildAll', {})
        diags = r.get('returnValue', [])
        errs = [d for d in diags if d['severity'] == 'Error']
        out.append('diagnostics=%d errors=%d' % (len(diags), len(errs)))
        for d in diags[:40]:
            out.append('%s %s:%d:%d %s' % (d['severity'], d['filePath'].split('/')[-1], d['span']['startLine'],
                                           d['span']['startCharacter'], d['message'][:300]))
    return '\n'.join(out)
