import std.stdio;
/**
 * E' una struttura semplice, che puo' contenere un array di
 * stringhe o solo una stringa
 */
struct Dirs {
    string[] value = ["."];

    this(inout(string)[] value) inout pure {
        this.value = value;
    }

    this(inout(string) value) inout pure {
        this([value]);
    }
}
unittest {
   Dirs d0 = Dirs("a");
   assert(d0.value.length == 1);
   Dirs d1 = Dirs(["x", "y"]);
   assert(d1.value.length == 2);
}

struct Files {
    string[] value;

    this(inout(string)[] value) inout pure {
        this.value = value;
    }

    this(inout(string) value) inout pure {
        this([value]);
    }
}

/**
 * E' una struttura template,
 * e F può essere qualsiasi cosa, ad esempio una funzione.
 *
 */
struct Filter(alias F) {
   /**
    * Questo e' invece un alias nel senso che func e'
    * sinonimo di F
    */
    alias func = F;
}

unittest {
   int addTwo(int x) { return x + 2; }

   auto f = Filter!(addTwo(3))();
   assert(f.func == 5);
   int z = 13;
   auto g = Filter!(z)();
   assert(g.func == 13);

   //auto h = Filter!(addTwo(z))(); non funziona, z non e' nota a compile-time
}

struct SourcesImpl(alias F) {
    Dirs dirs;
    Files files;
    Filter!F filter;

    alias filterFunc = F;
}

auto Sources(Dirs dirs = Dirs(), Files files = Files(), F = Filter!(a => true))() {
    return SourcesImpl!(F.func)(dirs, files);
}

auto Sources(string[] dirs, Files files = Files(), F = Filter!(a => true))() {
    return Sources!(Dirs(dirs), files, F)();
}

auto Sources(string dir, Files files = Files(), F = Filter!(a => true))() {
    return Sources!([dir], files, F)();
}
unittest {
   import std.stdio;
   auto s  = Sources!(".");
   writeln(s.dirs.value.length);
   writeln(s.files.value.length);
   enum f = Files(["a", "b"]);
   auto s1  = Sources!(".", f);
   writeln(s1.files.value.length);
}
