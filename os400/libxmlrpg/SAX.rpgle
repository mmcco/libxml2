      * Summary: Old SAX version 1 handler, deprecated
      * Description: DEPRECATED set of SAX version 1 interfaces used to
      *              build the DOM tree.
      *
      * Copy: See Copyright for the status of this software.
      *
      * Author: Patrick Monnerat <pm@datasphere.ch>, DATASPHERE S.A.

      /if not defined(XML_SAX_H__)
      /define XML_SAX_H__

      /include "libxmlrpg/xmlversion"
      /include "libxmlrpg/parser"
      /include "libxmlrpg/xlink"

      /if defined(LIBXML_LEGACY_ENABLED)

     d getPublicId     pr              *   extproc('getPublicId')               const char *
     d  ctx                            *   value                                void *

     d getSystemId     pr              *   extproc('getSystemId')               const char *
     d  ctx                            *   value                                void *

     d setDocumentLocator...
     d                 pr                  extproc('setDocumentLocator')
     d  ctx                            *   value                                void *
     d  loc                                value like(xmlSAXLocatorPtr)

     d getLineNumber   pr                  extproc('getLineNumber')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *

     d getColumnNumber...
     d                 pr                  extproc('getColumnNumber')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *

     d isStandalone    pr                  extproc('isStandalone')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *

     d hasInternalSubset...
     d                 pr                  extproc('hasInternalSubset')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *

     d hasExternalSubset...
     d                 pr                  extproc('hasExternalSubset')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *

     d internalSubset  pr                  extproc('internalSubset')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  ExternalID                     *   value options(*string)               const char *
     d  SystemID                       *   value options(*string)               const char *

     d externalSubset  pr                  extproc('externalSubset')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  ExternalID                     *   value options(*string)               const char *
     d  SystemID                       *   value options(*string)               const char *

     d getEntity       pr                  extproc('getEntity')
     d                                     like(xmlEntityPtr)
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *

     d getParameterEntity...
     d                 pr                  extproc('getParameterEntity')
     d                                     like(xmlEntityPtr)
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *

     d resolveEntity   pr                  extproc('resolveEntity')
     d                                     like(xmlParserInputPtr)
     d  ctx                            *   value                                void *
     d  publicId                       *   value options(*string)               const char *
     d  systemId                       *   value options(*string)               const char *

     d entityDecl      pr                  extproc('entityDecl')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  type                               value like(xmlCint)
     d  publicId                       *   value options(*string)               const char *
     d  systemId                       *   value options(*string)               const char *
     d  content                        *   value options(*string)               char *

     d attributeDecl   pr                  extproc('attributeDecl')
     d  ctx                            *   value                                void *
     d  elem                           *   value options(*string)               const char *
     d  fullname                       *   value options(*string)               const char *
     d  type                               value like(xmlCint)
     d  def                                value like(xmlCint)
     d  defaultValue                   *   value options(*string)               const char *
     d  tree                               value like(xmlEnumerationPtr)

     d elementDecl     pr                  extproc('elementDecl')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  type                               value like(xmlCint)
     d  content                            value like(xmlElementContentPtr)

     d notationDecl    pr                  extproc('notationDecl')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  publicId                       *   value options(*string)               const char *
     d  systemId                       *   value options(*string)               const char *

     d unparsedEntityDecl...
     d                 pr                  extproc('unparsedEntityDecl')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *
     d  publicId                       *   value options(*string)               const char *
     d  systemId                       *   value options(*string)               const char *
     d  notationName                   *   value options(*string)               const char *

     d startDocument   pr                  extproc('startDocument')
     d  ctx                            *   value                                void *

     d endDocument     pr                  extproc('endDocument')
     d  ctx                            *   value                                void *

     d attribute       pr                  extproc('attribute')
     d  ctx                            *   value                                void *
     d  fullname                       *   value options(*string)               const char *
     d  value                          *   value options(*string)               const char *

     d startElement    pr                  extproc('startElement')
     d  ctx                            *   value                                void *
     d  fullname                       *   value options(*string)               const char *
     d  atts                           *                                        const char *(*)

     d endElement      pr                  extproc('endElement')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *

     d reference       pr                  extproc('reference')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *

     d characters      pr                  extproc('characters')
     d  ctx                            *   value                                void *
     d  ch                             *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d ignorableWhitespace...
     d                 pr                  extproc('ignorableWhitespace')
     d  ctx                            *   value                                void *
     d  ch                             *   value options(*string)               const char *
     d  len                                value like(xmlCint)

     d processingInstruction...
     d                 pr                  extproc('processingInstruction')
     d  ctx                            *   value                                void *
     d  target                         *   value options(*string)               const char *
     d  data                           *   value options(*string)               const char *

     d globalNamespace...
     d                 pr                  extproc('globalNamespace')
     d  ctx                            *   value                                void *
     d  href                           *   value options(*string)               const char *
     d  prefix                         *   value options(*string)               const char *

     d setNamespace    pr                  extproc('setNamespace')
     d  ctx                            *   value                                void *
     d  name                           *   value options(*string)               const char *

     d getNamespace    pr                  extproc('getNamespace')
     d                                     like(xmlNsPtr)
     d  ctx                            *   value                                void *

     d checkNamespace  pr                  extproc('checkNamespace')
     d                                     like(xmlCint)
     d  ctx                            *   value                                void *
     d  nameSpace                      *   value options(*string)               char *

     d namespaceDecl   pr                  extproc('namespaceDecl')
     d  ctx                            *   value                                void *
     d  href                           *   value options(*string)               const char *
     d  prefix                         *   value options(*string)               const char *

     d comment         pr                  extproc('comment')
     d  ctx                            *   value                                void *
     d  value                          *   value options(*string)               const char *

     d cdataBlock      pr                  extproc('cdataBlock')
     d  ctx                            *   value                                void *
     d  value                          *   value options(*string)               const char *
     d  len                                value like(xmlCint)

      /if defined(LIBXML_SAX1_ENABLED)
     d initxmlDefaultSAXHandler...
     d                 pr                  extproc('initxmlDefaultSAXHandler')
     d  hdlr                               likeds(xmlSAXHandlerV1)
     d  warning                            value like(xmlCint)

      /if defined(LIBXML_HTML_ENABLED)
     d inithtmlDefaultSAXHandler...
     d                 pr                  extproc('inithtmlDefaultSAXHandler')
     d  hdlr                               likeds(xmlSAXHandlerV1)
      /endif

      /if defined(LIBXML_DOCB_ENABLED)
     d initdocbDefaultSAXHandler...
     d                 pr                  extproc('initdocbDefaultSAXHandler')
     d  hdlr                               likeds(xmlSAXHandlerV1)
      /endif
      /endif                                                                    LIBXML_SAX1_ENABLED

      /endif                                                                    LIBXML_LEGACY_ENABLD

      /endif                                                                    XML_SAX_H__
