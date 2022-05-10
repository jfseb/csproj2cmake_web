# csproj2cmake_web
A simple csproj to CMakeLists.txt file converter running in the browser


The transformation is performed in the browser at

[https://jfseb.github.io/csproj2cmake_web/csproj2cmake.html](https://jfseb.github.io/csproj2cmake_web/csproj2cmake.html)

(best use copy paste, template selection etc. not supported yet)

# local storage

source
templates

are stored in the browser db and thus allos pasting a
proprietary template.

Press Clear Template to refresh from github
templates


# templates

templates


# actual translation

- tags are extracted by an XSLT from a csproj file


- the values are entered into the template

A_K_E_Y will be replaced by the value,
for multiple values with a "\n    " separted concatenation.

```
#[[FOREACH_AKEY SOMETHING A_K_E_Y SOMETHINGELSE ]]
```
will be replaced once per record
```
  SOMETHING <value> SOMETHINGELSE
```

```
#[[IF_AKEY

#ELSE_AKEY

#ENDIF_AKEY]]
```

