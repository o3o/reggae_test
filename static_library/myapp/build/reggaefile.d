import reggae;


alias src = Sources!(`../src`);
alias MAIN_OBJ = objectFiles!(src, Flags(`-L-l../../animal/build/animal`),
      ImportPaths([`../../animal/src`])
      );

alias app = reggae.scriptlike!(App(SourceFileName(`../src/app.d`), BinaryFileName(`cacc`)),
      Flags(),
      ImportPaths([`../../animal/src`])
      );

mixin build!(app);
