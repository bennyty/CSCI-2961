#Lab4

I searched FreeBSD for grammar typos and found one. Fixed and submitted it.

![Looks like puush died](http://puu.sh/knOWE/b4c844ee54.png)

```
Index: README
===================================================================
--- README	(revision 288219)
+++ README	(working copy)
@@ -14,8 +14,8 @@
   (kgdb) 
 
 
-This directory also contains a kgdb script that given a crash dump number
-automatically extract the path to the kernel source, run gdb to extract
-information about kernel modules loaded, and then rerun gdb loading the
+This directory also contains a kgdb script that, given a crash dump number,
+automatically extracts the path to the kernel source, runs gdb to extract
+information about kernel modules loaded, and then reruns gdb to load the
 necessary symbols for the modules.  You need to make sure you build the
-modules w/ debugging symbols separately to get things to work.
+modules with debugging symbols separately to get things to work.
```
