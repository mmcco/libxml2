      * Summary: interfaces to the Catalog handling system
      * Description: the catalog module implements the support for
      * XML Catalogs and SGML catalogs
      *
      * SGML Open Technical Resolution TR9401:1997.
      * http://www.jclark.com/sp/catalog.htm
      *
      * XML Catalogs Working Draft 06 August 2001
      * http://www.oasis-open.org/committees/entity/spec-2001-08-06.html
      *
      * Copy: See Copyright for the status of this software.
      *
      * Author: Patrick Monnerat <pm@datasphere.ch>, DATASPHERE S.A.

      /if not defined(XML_CATALOG_H__)
      /define XML_CATALOG_H__

      /include "libxmlrpg/xmlversion"

      /if defined(LIBXML_CATALOG_ENABLED)

      /include "libxmlrpg/xmlTypesC"
      /include "libxmlrpg/xmlstring"
      /include "libxmlrpg/tree"

      * XML_CATALOGS_NAMESPACE:
      *
      * The namespace for the XML Catalogs elements.

     d XML_CATALOGS_NAMESPACE...
     d                 c                   'urn:oasis:names:+
     d                                      tc:entity:xmlns:xml:catalog'

      * XML_CATALOG_PI:
      *
      * The specific XML Catalog Processing Instuction name.

     d XML_CATALOG_PI  c                   'oasis-xml-catalog'

      * The API is voluntarily limited to general cataloging.

     d xmlCatalogPrefer...
     d                 s                   based(######typedef######)
     d                                     like(xmlCenum)
     d XML_CATA_PREFER_NONE...
     d                 c                   0
     d XML_CATA_PREFER_PUBLIC...
     d                 c                   1
     d XML_CATA_PREFER_SYSTEM...
     d                 c                   2

     d xmlCatalogAllow...
     d                 s                   based(######typedef######)
     d                                     like(xmlCenum)
     d XML_CATA_ALLOW_NONE...
     d                 c                   0
     d XML_CATA_ALLOW_GLOBAL...
     d                 c                   1
     d XML_CATA_ALLOW_DOCUMENT...
     d                 c                   2
     d XML_CATA_ALLOW_ALL...
     d                 c                   3

     d xmlCatalogPtr   s               *   based(######typedef######)

      * Operations on a given catalog.

     d xmlNewCatalog   pr                  extproc('xmlNewCatalog')
     d                                     like(xmlCatalogPtr)
     d  sgml                               value like(xmlCint)

     d xmlLoadACatalog...
     d                 pr                  extproc('xmlLoadACatalog')
     d                                     like(xmlCatalogPtr)
     d  filename                       *   value options(*string)               const char *

     d xmlLoadSGMLSuperCatalog...
     d                 pr                  extproc('xmlLoadSGMLSuperCatalog')
     d                                     like(xmlCatalogPtr)
     d  filename                       *   value options(*string)               const char *

     d xmlConvertSGMLCatalog...
     d                 pr                  extproc('xmlConvertSGMLCatalog')
     d                                     like(xmlCint)
     d  catal                              value like(xmlCatalogPtr)

     d xmlACatalogAdd  pr                  extproc('xmlACatalogAdd')
     d                                     like(xmlCint)
     d  catal                              value like(xmlCatalogPtr)
     d  type                           *   value options(*string)               const char *
     d  orig                           *   value options(*string)               const char *
     d  replace                        *   value options(*string)               const char *

     d xmlACatalogRemove...
     d                 pr                  extproc('xmlACatalogRemove')
     d                                     like(xmlCint)
     d  catal                              value like(xmlCatalogPtr)
     d  value                          *   value options(*string)               const char *

     d xmlACatalogResolve...
     d                 pr              *   extproc('xmlACatalogResolve')        char *
     d  catal                              value like(xmlCatalogPtr)
     d  pubID                          *   value options(*string)               const char *
     d  sysID                          *   value options(*string)               const char *

     d xmlACatalogResolveSystem...
     d                 pr              *   extproc('xmlACatalogResolveSystem')  char *
     d  catal                              value like(xmlCatalogPtr)
     d  sysID                          *   value options(*string)               const char *

     d xmlACatalogResolvePublic...
     d                 pr              *   extproc('xmlACatalogResolvePublic')  char *
     d  catal                              value like(xmlCatalogPtr)
     d  pubID                          *   value options(*string)               const char *

     d xmlACatalogResolveURI...
     d                 pr              *   extproc('xmlACatalogResolveURI')     char *
     d  catal                              value like(xmlCatalogPtr)
     d  URI                            *   value options(*string)               const char *

      /if defined(LIBXML_OUTPUT_ENABLED)
     d xmlACatalogDump...
     d                 pr                  extproc('xmlACatalogDump')
     d  catal                              value like(xmlCatalogPtr)
     d  out                            *   value                                FILE *
      /endif                                                                    LIBXML_OUTPUT_ENABLD

     d xmlFreeCatalog  pr                  extproc('xmlFreeCatalog')
     d  catal                              value like(xmlCatalogPtr)

     d xmlCatalogIsEmpty...
     d                 pr                  extproc('xmlCatalogIsEmpty')
     d                                     like(xmlCint)
     d  catal                              value like(xmlCatalogPtr)

      * Global operations.

     d xmlInitializeCatalog...
     d                 pr                  extproc('xmlInitializeCatalog')

     d xmlLoadCatalog  pr                  extproc('xmlLoadCatalog')
     d                                     like(xmlCint)
     d  filename                       *   value options(*string)               const char *

     d xmlLoadCatalogs...
     d                 pr                  extproc('xmlLoadCatalogs')
     d  paths                          *   value options(*string)               const char *

     d xmlCatalogCleanup...
     d                 pr                  extproc('xmlCatalogCleanup')

      /if defined(LIBXML_OUTPUT_ENABLED)
     d xmlCatalogDump  pr                  extproc('xmlCatalogDump')
     d  out                            *   value                                FILE *
      /endif                                                                    LIBXML_OUTPUT_ENABLD

     d xmlCatalogResolve...
     d                 pr              *   extproc('xmlCatalogResolve')         char *
     d  pubID                          *   value options(*string)               const char *
     d  sysID                          *   value options(*string)               const char *

     d xmlCatalogResolveSystem...
     d                 pr              *   extproc('xmlCatalogResolveSystem')   char *
     d  sysID                          *   value options(*string)               const char *

     d xmlCatalogResolvePublic...
     d                 pr              *   extproc('xmlCatalogResolvePublic')   char *
     d  pubID                          *   value options(*string)               const char *

     d xmlCatalogResolveURI...
     d                 pr              *   extproc('xmlCatalogResolveURI')      char *
     d  URI                            *   value options(*string)               const char *

     d xmlCatalogAdd   pr                  extproc('xmlCatalogAdd')
     d                                     like(xmlCint)
     d  type                           *   value options(*string)               const char *
     d  orig                           *   value options(*string)               const char *
     d  replace                        *   value options(*string)               const char *

     d xmlCatalogRemove...
     d                 pr                  extproc('xmlCatalogRemove')
     d                                     like(xmlCint)
     d  value                          *   value options(*string)               const char *

     d xmlParseCatalogFile...
     d                 pr                  extproc('xmlParseCatalogFile')
     d                                     like(xmlDocPtr)
     d  filename                       *   value options(*string)               const char *

     d xmlCatalogConvert...
     d                 pr                  extproc('xmlCatalogConvert')
     d                                     like(xmlCint)

      * Strictly minimal interfaces for per-document catalogs used
      * by the parser.

     d xmlCatalogFreeLocal...
     d                 pr                  extproc('xmlCatalogFreeLocal')
     d  catalogs                       *   value                                void *

     d xmlCatalogAddLocal...
     d                 pr              *   extproc('xmlCatalogAddLocal')        void *
     d  catalogs                       *   value                                void *
     d  URL                            *   value options(*string)               const char *

     d xmlCatalogLocalResolve...
     d                 pr              *   extproc('xmlCatalogLocalResolve')    char *
     d  catalogs                       *   value                                void *
     d  pubID                          *   value options(*string)               const char *
     d  sysID                          *   value options(*string)               const char *

     d xmlCatalogLocalResolveURI...
     d                 pr              *   extproc('xmlCatalogLocalResolveURI') char *
     d  catalogs                       *   value                                void *
     d  URI                            *   value options(*string)               const char *

      * Preference settings.

     d xmlCatalogSetDebug...
     d                 pr                  extproc('xmlCatalogSetDebug')
     d                                     like(xmlCint)
     d  level                              value like(xmlCint)

     d xmlCatalogSetDefaultPrefer...
     d                 pr                  extproc('xmlCatalogSetDefaultPrefer')
     d                                     like(xmlCatalogPrefer)
     d  prefer                             value like(xmlCatalogPrefer)

     d xmlCatalogSetDefaults...
     d                 pr                  extproc('xmlCatalogSetDefaults')
     d  allow                              value like(xmlCatalogAllow)

     d xmlCatalogGetDefaults...
     d                 pr                  extproc('xmlCatalogGetDefaults')
     d                                     like(xmlCatalogAllow)

      * DEPRECATED interfaces

     d xmlCatalogGetSystem...
     d                 pr              *   extproc('xmlCatalogGetSystem')       const char *
     d  sysID                          *   value options(*string)               const char *

     d xmlCatalogGetPublic...
     d                 pr              *   extproc('xmlCatalogGetPublic')       const char *
     d  pubID                          *   value options(*string)               const char *

      /endif                                                                    LIBXML_CATALOG_ENBLD
      /endif                                                                    XML_CATALOG_H__
