struct Dirs {
    string[] value = ["."];

    this(inout(string)[] value) inout pure {
        this.value = value;
    }

    this(inout(string) value) inout pure {
        this([value]);
    }
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

struct Filter(alias F) {
    alias func = F;
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
import std.stdio;
void main(string[] args) {
   auto s  = Sources!(".");
   writeln(s.dirs.value.length);
   writeln(s.files.value.length);
   enum f = Files(["a", "b"]);
   auto s1  = Sources!(".", f);
   writeln(s1.files.value.length);
}
