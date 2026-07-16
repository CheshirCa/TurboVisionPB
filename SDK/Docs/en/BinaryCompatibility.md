<!-- TurboVisionPB 0.16.8 | (C) CheshirCa 2026 -->

# Binary compatibility

[Русская версия](../BinaryCompatibility.md)

The documented DLL export table is the ABI. Internal symbols, source
structures, and `TV_Internal*` names are not part of the API.

- compatibility is preserved within one major version;
- minor versions may add functions;
- changing a signature or public structure layout requires a major version or
  a new versioned structure;
- the DLL and include must have the same `#TV_API_VERSION`;
- applications must not locate or invoke internal symbols.

`TV_Config` starts with `StructureSize` and `APIVersion`; `TV_Init()` validates
both. `TV_CheckAPIVersion()` and `TV_InitEx()` provide explicit checks.

The DLL exports cdecl functions (`ProcedureCDLL`), and the public include uses
`ImportC`. Numeric IDs are opaque. Caller-provided memory remains owned by the
caller, and the DLL does not return pointers that must be freed.

Strings are copied to caller-owned UTF-16 buffers through `TV_Copy*`
functions. Their return value is the required character capacity, including
the terminating null.
