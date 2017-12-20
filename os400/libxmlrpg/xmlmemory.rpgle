      * Summary: interface for the memory allocator
      * Description: provides interfaces for the memory allocator,
      *              including debugging capabilities.
      *
      * Copy: See Copyright for the status of this software.
      *
      * Author: Patrick Monnerat <pm@datasphere.ch>, DATASPHERE S.A.

      /if not defined(DEBUG_MEMORY_ALLOC__)
      /define DEBUG_MEMORY_ALLOC__

      /include "libxmlrpg/xmlversion"
      /include "libxmlrpg/xmlTypesC"

      * DEBUG_MEMORY:
      *
      * DEBUG_MEMORY replaces the allocator with a collect and debug
      * shell to the libc allocator.
      * DEBUG_MEMORY should only be activated when debugging
      * libxml i.e. if libxml has been configured with --with-debug-mem too.

      * /define DEBUG_MEMORY_FREED
      * /define DEBUG_MEMORY_LOCATION

      /if defined(DEBUG)
      /if not defined(DEBUG_MEMORY)
      /define DEBUG_MEMORY
      /endif
      /endif

      * DEBUG_MEMORY_LOCATION:
      *
      * DEBUG_MEMORY_LOCATION should be activated only when debugging
      * libxml i.e. if libxml has been configured with --with-debug-mem too.

      /if defined(DEBUG_MEMORY_LOCATION)
      /endif

      * The XML memory wrapper support 4 basic overloadable functions.

      * xmlFreeFunc:
      * @mem: an already allocated block of memory
      *
      * Signature for a free() implementation.

     d xmlFreeFunc     s               *   based(######typedef######)
     d                                     procptr

      * mallocFunc:
      * @size:  the size requested in bytes
      *
      * Signature for a malloc() implementation.
      *
      * Returns a pointer to the newly allocated block or NULL in case of error.

     d mallocFunc   s               *   based(######typedef######)
     d                                     procptr

      * reallocFunc:
      * @mem: an already allocated block of memory
      * @size:  the new size requested in bytes
      *
      * Signature for a realloc() implementation.
      *
      * Returns a pointer to the newly reallocated block or NULL in case of error.

     d reallocFunc  s               *   based(######typedef######)
     d                                     procptr

      * xmlStrdupFunc:
      * @str: a zero terminated string
      *
      * Signature for an strdup() implementation.
      *
      * Returns the copy of the string or NULL in case of error.

     d xmlStrdupFunc   s               *   based(######typedef######)
     d                                     procptr

      * The 5 interfaces used for all memory handling within libxml.
      * Since indirect calls are only supported via a based prototype,
      *   storage is accessed via functions.

     d get_xmlFree     pr                  extproc('__get_xmlFree')
     d                                     like(xmlFreeFunc)

     d set_xmlFree     pr                  extproc('__set_xmlFree')
     d  func                               value like(xmlFreeFunc)

     d xmlFree         pr                  extproc('__call_xmlFree')
     d  mem                            *   value                                void *

     d get_malloc   pr                  extproc('__get_malloc')
     d                                     like(mallocFunc)

     d set_malloc   pr                  extproc('__set_malloc')
     d  func                               value like(mallocFunc)

     d malloc       pr              *   extproc('__call_malloc')          void *
     d  size                               value like(xmlCsize_t)

     d get_malloc...
     d                 pr                  extproc('__get_malloc')
     d                                     like(mallocFunc)

     d set_malloc...
     d                 pr                  extproc('__set_malloc')
     d  func                               value like(mallocFunc)

     d malloc...
     d                 pr              *   extproc('__call_malloc')    void *
     d  size                               value like(xmlCsize_t)

     d get_realloc  pr                  extproc('__get_realloc')
     d                                     like(reallocFunc)

     d set_realloc  pr                  extproc('__set_realloc')
     d  func                               value like(reallocFunc)

     d realloc      pr              *   extproc('__call_realloc')         void *
     d  mem                            *   value                                void *
     d  size                               value like(xmlCsize_t)

     d get_xmlMemStrdup...
     d                 pr                  extproc('__get_xmlMemStrdup')
     d                                     like(xmlStrdupFunc)

     d set_xmlMemStrdup...
     d                 pr                  extproc('__set_xmlMemstrdup')
     d  func                               value like(xmlStrdupFunc)

     d xmlMemStrdup    pr              *   extproc('__call_xmlMemStrdup')          void *
     d  str                            *   value options(*string)               const char *

      * The way to overload the existing functions.
      * The xmlGc function have an extra entry for atomic block
      * allocations useful for garbage collected memory allocators

     d xmlMemSetup     pr                  extproc('xmlMemSetup')
     d                                     like(xmlCint)
     d  freeFunc                           value like(xmlFreeFunc)
     d  mallocFunc                         value like(mallocFunc)
     d  reallocFunc                        value like(reallocFunc)
     d  strdupFunc                         value like(xmlStrdupFunc)

     d xmlMemGet       pr                  extproc('xmlMemGet')
     d                                     like(xmlCint)
     d  freeFunc                           like(xmlFreeFunc)
     d  mallocFunc                         like(mallocFunc)
     d  reallocFunc                        like(reallocFunc)
     d  strdupFunc                         like(xmlStrdupFunc)

     d xmlGcMemSetup   pr                  extproc('xmlGcMemSetup')
     d                                     like(xmlCint)
     d  freeFunc                           value like(xmlFreeFunc)
     d  mallocFunc                         value like(mallocFunc)
     d  mallocFunc...
     d                                     value like(mallocFunc)
     d  reallocFunc                        value like(reallocFunc)
     d  strdupFunc                         value like(xmlStrdupFunc)

     d xmlGcMemGet     pr                  extproc('xmlGcMemGet')
     d                                     like(xmlCint)
     d  freeFunc                           like(xmlFreeFunc)
     d  mallocFunc                         like(mallocFunc)
     d  mallocFunc...
     d                                     like(mallocFunc)
     d  reallocFunc                        like(reallocFunc)
     d  strdupFunc                         like(xmlStrdupFunc)

      * Initialization of the memory layer.

     d xmlInitMemory   pr                  extproc('xmlInitMemory')
     d                                     like(xmlCint)

      * Cleanup of the memory layer.

     d xmlCleanupMemory...
     d                 pr                  extproc('xmlCleanupMemory')

      * These are specific to the XML debug memory wrapper.

     d xmlMemUsed      pr                  extproc('xmlMemUsed')
     d                                     like(xmlCint)

     d xmlMemBlocks    pr                  extproc('xmlMemBlocks')
     d                                     like(xmlCint)

     d xmlMemDisplay   pr                  extproc('xmlMemDisplay')
     d  fp                             *   value                                FILE *

     d xmlMmDisplayLast...
     d                 pr                  extproc('xmlMemDisplayLast')
     d  fp                             *   value                                FILE *
     d  nbBytes                            value like(xmlClong)

     d xmlMemShow      pr                  extproc('xmlMemShow')
     d  fp                             *   value                                FILE *
     d  nr                                 value like(xmlCint)

     d xmlMemoryDump   pr                  extproc('xmlMemoryDump')

     d xmlMemMalloc    pr              *   extproc('xmlMemMalloc')              void *
     d  size                               value like(xmlCsize_t)

     d xmlMemRealloc   pr              *   extproc('xmlMemRealloc')             void *
     d  ptr                            *   value                                void *
     d  size                               value like(xmlCsize_t)

     d xmlMemFree      pr                  extproc('xmlMemFree')
     d  ptr                            *   value                                void *

     d xmlMemoryStrdup...
     d                 pr              *   extproc('xmlMemoryStrdup')           char *
     d  str                            *   value options(*string)               const char *

     d mallocLoc    pr              *   extproc('mallocLoc')              void *
     d  size                               value like(xmlCsize_t)
     d  file                           *   value options(*string)               const char *
     d  line                               value like(xmlCint)

     d reallocLoc   pr              *   extproc('reallocLoc')              void *
     d  ptr                            *   value                                void *
     d  size                               value like(xmlCsize_t)
     d  file                           *   value options(*string)               const char *
     d  line                               value like(xmlCint)

     d mallocLoc...
     d                 pr              *   extproc('mallocLoc')        void *
     d  size                               value like(xmlCsize_t)
     d  file                           *   value options(*string)               const char *
     d  line                               value like(xmlCint)

     d xmlMemStrdupLoc...
     d                 pr              *   extproc('xmlMemStrdupLoc')           char *
     d  str                            *   value options(*string)               const char *
     d  file                           *   value options(*string)               const char *
     d  line                               value like(xmlCint)

      /if not defined(XML_GLOBALS_H)
      /if not defined(XML_THREADS_H__)
      /include "libxmlrpg/threads"
      /include "libxmlrpg/globals"
      /endif
      /endif

      /endif                                                                    DEBUG_MEMORY_ALLOC__
