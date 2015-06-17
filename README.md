# jaudiotagger-debs
Build Debian Package for Jaudiotagger (v2.1.0)

**Instructions**

Inside of the debs folder

**Gets orig source code**

```
debian/rules get-orig-source
```

**Check dependencies**

```
dpkg-checkbuilddeps
```

**Build source package**

```
debuild -S -nc -uc -us
```

**Tested**

```
Debian wheezy
```
```
Debian jessie
```

