//module animal.reggaefile;
import reggae;

enum src = [`../src/animal/cat.d`, `../src/animal/dog.d`];
/+
alias lib = staticLibrary!(`animal` ~ libExt,
      Sources!(Dirs(), Files(src))
      );
   +/
alias lib = staticLibrary!(`libanimal` ~ libExt, Sources!("../src"));

mixin build!(lib);
