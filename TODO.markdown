# current bugs
- pegar a veces no pega con 'p' , desde modo insertar si va

# regexes
\<WORD\>
\$\_POST\[(.*)\]     -->    \$this\-\>request\-\>get\_POST(\1)
\$data\['([^]]*)'\]      -->    \$\1
:%s/\$_POST\[\([^]]*\)\]/\$this\-\>request\-\>get\_POST\(\1\)/gc

### NOTAS
* http://whileimautomaton.net/2008/11/vimm3/operator:
```
Forcing *wise (advanced)
You can force *wise with the following keys:
v - characterwise
V - linewise
<C-v> - blockwise
Usage: {operator}{*wise-specifier}{motion}
dvj - characterwise
dVj - linewise
d<C-v>j - blockwise
```

