# csproj2cmake_web
A simple csproj to CMakeLists.txt file converter running in the browser



#

- the following tags are extracted by an XSLT from a csproj file

XX X



- teh values are entered into the template

A_K_E_Y will be replaced by the value,
for multiple values with a "\n    " separted concatenation.

```
#[[FOREACH_AKEY SOMETHING A_K_E_Y SOMETHINGELSE ]]
```

will be replaced once per record

```
  SOMETHING <value> SOMETHINGELSE
```



