## SketchKit: Framework for building Sketch plugins

SketchKit is a framework that helps developers build Sketch plugins. Sketch's internal objects are mostly undocumented, and can change at any time. SketchKit provides an interface which lets you use these objects without risking a crash, and without having to update your plugin every time the internal objects change. Instead, SketchKit is updated and the method names are changed.

Proxy objects are prefixed with SKK_
