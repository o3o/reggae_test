Tentativo di compilare con struttura in stile dub

```
cd animal
dmd -lib src/animal/*.d -oflibanimal
cd ../myapp
dmd -I../animal/src ../animal/libanimal.a src/*.d
// oppure
dmd -I../animal/src -L-l../animal/animal -ofcul src/*.d
```
`-L` passa l'opzione al linker, e `-l` indica la libreria da usare
