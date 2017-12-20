      * Summary: set of routines to process strings
      * Description: type and interfaces needed for the internal string
      *              handling of the library, especially UTF8 processing.
      *
      * Copy: See Copyright for the status of this software.
      *
      * Author: Patrick Monnerat <pm@datasphere.ch>, DATASPHERE S.A.

      /if not defined(XML_STRING_H__)
      /define XML_STRING_H__

      /include "libxmlrpg/xmlversion"
      /include "libxmlrpg/xmlTypesC"
      /include "libxmlrpg/xmlstdarg"

      * char:
      *
      * This is a basic byte in an UTF-8 encoded string.
      * It's unsigned allowing to pinpoint case where char * are assigned
      * to char * (possibly making serialization back impossible).

     d char         s                   based(######typedef######)
     d                                     like(xmlCuchar)

      * char handling

     d xmlStrdup       pr              *   extproc('xmlStrdup')                 char *
     d  cur                            *   value options(*string)               const char *

     d xmlStrndup      pr              *   extproc('xmlStrndup')                char *
     d  cur                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d charStrndup  pr              *   extproc('charStrndup')            char *
     d  cur                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d charStrdup   pr              *   extproc('charStrdup')             char *
     d  cur                            *   value options(*string)               const char *

     d xmlStrsub       pr              *   extproc('xmlStrsub')                 const char *
     d  str                            *   value options(*string)               const char *
     d  start                              value like(xmlCint)
     d  len                                value like(xmlCint)

     d xmlStrchr       pr              *   extproc('xmlStrchr')                 const char *
     d  str                            *   value options(*string)               const char *
     d  val                                value like(char)

     d xmlStrstr       pr              *   extproc('xmlStrstr')                 const char *
     d  str                            *   value options(*string)               const char *
     d  val                            *   value options(*string)               const char *

     d xmlStrcasestr   pr              *   extproc('xmlStrcasestr')             const char *
     d  str                            *   value options(*string)               const char *
     d  val                            *   value options(*string)               const char *

     d xmlStrcmp       pr                  extproc('xmlStrcmp')
     d                                     like(xmlCint)
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *

     d xmlStrncmp      pr                  extproc('xmlStrncmp')
     d                                     like(xmlCint)
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d xmlStrcasecmp   pr                  extproc('xmlStrcasecmp')
     d                                     like(xmlCint)
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *

     d xmlStrncasecmp  pr                  extproc('xmlStrncasecmp')
     d                                     like(xmlCint)
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d xmlStrEqual     pr                  extproc('xmlStrEqual')
     d                                     like(xmlCint)
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *

     d xmlStrQEqual    pr                  extproc('xmlStrQEqual')
     d                                     like(xmlCint)
     d  pref                           *   value options(*string)               const char *
     d  name                           *   value options(*string)               const char *
     d  stre                           *   value options(*string)               const char *

     d xmlStrlen       pr                  extproc('xmlStrlen')
     d                                     like(xmlCint)
     d  str                            *   value options(*string)               const char *

     d xmlStrcat       pr              *   extproc('xmlStrcat')                 char *
     d  cur                            *   value options(*string)               char *
     d  add                            *   value options(*string)               const char *

     d xmlStrncat      pr              *   extproc('xmlStrncat')                char *
     d  cur                            *   value options(*string)               char *
     d  add                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d xmlStrncatNew   pr              *   extproc('xmlStrncatNew')             char *
     d  str1                           *   value options(*string)               const char *
     d  str2                           *   value options(*string)               const char *
     d  len                                value like(xmlCint)

      * xmlStrPrintf() is a vararg function.
      * The following prototype supports up to 8 pointer arguments.
      * Other argument signature can be achieved by defining alternate
      *   prototypes redirected to the same function.

     d xmlStrPrintf    pr                  extproc('xmlStrPrintf')
     d                                     like(xmlCint)
     d  buf                            *   value options(*string)               char *
     d  len                                value like(xmlCint)
     d  msg                            *   value options(*string)               const char *
     d  arg1                           *   value options(*string: *nopass)
     d  arg2                           *   value options(*string: *nopass)
     d  arg3                           *   value options(*string: *nopass)
     d  arg4                           *   value options(*string: *nopass)
     d  arg5                           *   value options(*string: *nopass)
     d  arg6                           *   value options(*string: *nopass)
     d  arg7                           *   value options(*string: *nopass)
     d  arg8                           *   value options(*string: *nopass)

     d xmlStrVPrintf   pr                  extproc('xmlStrVPrintf')
     d                                     like(xmlCint)
     d  buf                            *   value options(*string)               char *
     d  len                                value like(xmlCint)
     d  msg                            *   value options(*string)               const char *
     d  ap                                 likeds(xmlVaList)

     d xmlGetUTF8Char  pr                  extproc('xmlGetUTF8Char')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const uns. char *
     d  len                                like(xmlCint)

     d xmlCheckUTF8    pr                  extproc('xmlCheckUTF8')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const uns. char *

     d xmlUTF8Strsize  pr                  extproc('xmlUTF8Strsize')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d xmlUTF8Strndup  pr              *   extproc('xmlUTF8Strndup')            char *
     d  utf                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d xmlUTF8Strpos   pr              *   extproc('xmlUTF8Strpos')             const char *
     d  utf                            *   value options(*string)               const char *
     d  pos                                value like(xmlCint)

     d xmlUTF8Strloc   pr                  extproc('xmlUTF8Strloc')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const char *
     d  utfchar                        *   value options(*string)               const char *

     d xmlUTF8Strsub   pr              *   extproc('xmlUTF8Strsub')             char *
     d  utf                            *   value options(*string)               const char *
     d  start                              value like(xmlCint)
     d  len                                value like(xmlCint)

     d xmlUTF8Strlen   pr                  extproc('xmlUTF8Strlen')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const char *

     d xmlUTF8Size     pr                  extproc('xmlUTF8Size')
     d                                     like(xmlCint)
     d  utf                            *   value options(*string)               const char *

     d xmlUTF8Charcmp  pr                  extproc('xmlUTF8Charcmp')
     d                                     like(xmlCint)
     d  utf1                           *   value options(*string)               const char *
     d  utf2                           *   value options(*string)               const char *

      /endif                                                                    XML_STRING_H__
