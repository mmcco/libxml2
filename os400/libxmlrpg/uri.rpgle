      * Summary: library of generic URI related routines
      * Description: library of generic URI related routines
      *              Implements RFC 2396
      *
      * Copy: See Copyright for the status of this software.
      *
      * Author: Patrick Monnerat <pm@datasphere.ch>, DATASPHERE S.A.

      /if not defined(XML_URI_H__)
      /define XML_URI_H__

      /include "libxmlrpg/xmlversion"
      /include "libxmlrpg/xmlTypesC"
      /include "libxmlrpg/tree"

      * xmlURI:
      *
      * A parsed URI reference. This is a struct containing the various fields
      * as described in RFC 2396 but separated for further processing.
      *
      * Note: query is a deprecated field which is incorrectly unescaped.
      * query_raw takes precedence over query if the former is set.
      * See: http://mail.gnome.org/archives/xml/2007-April/thread.html#00127

     d xmlURIPtr       s               *   based(######typedef######)

     d xmlURI          ds                  based(xmlURIPtr)
     d                                     align qualified
     d  scheme                         *                                        char *
     d  opaque                         *                                        char *
     d  authority                      *                                        char *
     d  server                         *                                        char *
     d  user                           *                                        char *
     d  port                               like(xmlCint)
     d  path                           *                                        char *
     d  query                          *                                        char *
     d  fragment                       *                                        char *
     d  cleanup                            like(xmlCint)
     d  query_raw                      *                                        char *

     d xmlCreateURI    pr                  extproc('xmlCreateURI')
     d                                     like(xmlURIPtr)

     d xmlBuildURI     pr              *   extproc('xmlBuildURI')               char *
     d  URI                            *   value options(*string)               const char *
     d  base                           *   value options(*string)               const char *

     d xmlBuildRelativeURI...
     d                 pr              *   extproc('xmlBuildRelativeURI')       char *
     d  URI                            *   value options(*string)               const char *
     d  base                           *   value options(*string)               const char *

     d xmlParseURI     pr                  extproc('xmlParseURI')
     d                                     like(xmlURIPtr)
     d  str                            *   value options(*string)               const char *

     d xmlParseURIRaw  pr                  extproc('xmlParseURIRaw')
     d                                     like(xmlURIPtr)
     d  str                            *   value options(*string)               const char *
     d  raw                                value like(xmlCint)

     d xmlParseURIReference...
     d                 pr                  extproc('xmlParseURIReference')
     d                                     like(xmlCint)
     d  uri                                value like(xmlURIPtr)
     d  str                            *   value options(*string)               const char *

     d xmlSaveUri      pr              *   extproc('xmlSaveUri')                char *
     d  uri                                value like(xmlURIPtr)

     d xmlPrintURI     pr                  extproc('xmlPrintURI')
     d  stream                         *   value                                FILE *
     d  uri                                value like(xmlURIPtr)

     d xmlURIEscapeStr...
     d                 pr              *   extproc('xmlURIEscapeStr')           char *
     d  str                            *   value options(*string)               const char *
     d  list                           *   value options(*string)               const char *

     d xmlURIUnescapeString...
     d                 pr              *   extproc('xmlURIUnescapeString')      char *
     d  str                            *   value options(*string)               const char *
     d  len                                value like(xmlCint)
     d  target                         *   value options(*string)               char *

     d xmlNormalizeURIPath...
     d                 pr                  extproc('xmlNormalizeURIPath')
     d                                     like(xmlCint)
     d  path                           *   value options(*string)               char *

     d xmlURIEscape    pr              *   extproc('xmlURIEscape')              char *
     d  str                            *   value options(*string)               const char *

     d xmlFreeURI      pr                  extproc('xmlFreeURI')
     d  uri                                value like(xmlURIPtr)

     d xmlCanonicPath  pr              *   extproc('xmlCanonicPath')            char *
     d  path                           *   value options(*string)               const char *

     d xmlPathToURI    pr              *   extproc('xmlPathToURI')              char *
     d  path                           *   value options(*string)               const char *

      /endif                                                                    XML_URI_H__
