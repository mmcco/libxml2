/*
 * Summary: SAX2 parser interface used to build the DOM tree
 * Description: those are the default SAX2 interfaces used by
 *              the library when building DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */


#ifndef __XML_SAX2_H__
#define __XML_SAX2_H__

#include <stdio.h>
#include <stdlib.h>
#include <libxml/xmlversion.h>
#include <libxml/parser.h>
#include <libxml/xlink.h>

#ifdef __cplusplus
extern "C" {
#endif
XMLPUBFUN const char * XMLCALL
		xmlSAX2GetPublicId		(void *ctx);
XMLPUBFUN const char * XMLCALL
		xmlSAX2GetSystemId		(void *ctx);
XMLPUBFUN void XMLCALL
		xmlSAX2SetDocumentLocator	(void *ctx,
						 xmlSAXLocatorPtr loc);

XMLPUBFUN int XMLCALL
		xmlSAX2GetLineNumber		(void *ctx);
XMLPUBFUN int XMLCALL
		xmlSAX2GetColumnNumber		(void *ctx);

XMLPUBFUN int XMLCALL
		xmlSAX2IsStandalone		(void *ctx);
XMLPUBFUN int XMLCALL
		xmlSAX2HasInternalSubset	(void *ctx);
XMLPUBFUN int XMLCALL
		xmlSAX2HasExternalSubset	(void *ctx);

XMLPUBFUN void XMLCALL
		xmlSAX2InternalSubset		(void *ctx,
						 const char *name,
						 const char *ExternalID,
						 const char *SystemID);
XMLPUBFUN void XMLCALL
		xmlSAX2ExternalSubset		(void *ctx,
						 const char *name,
						 const char *ExternalID,
						 const char *SystemID);
XMLPUBFUN xmlEntityPtr XMLCALL
		xmlSAX2GetEntity		(void *ctx,
						 const char *name);
XMLPUBFUN xmlEntityPtr XMLCALL
		xmlSAX2GetParameterEntity	(void *ctx,
						 const char *name);
XMLPUBFUN xmlParserInputPtr XMLCALL
		xmlSAX2ResolveEntity		(void *ctx,
						 const char *publicId,
						 const char *systemId);

XMLPUBFUN void XMLCALL
		xmlSAX2EntityDecl		(void *ctx,
						 const char *name,
						 int type,
						 const char *publicId,
						 const char *systemId,
						 char *content);
XMLPUBFUN void XMLCALL
		xmlSAX2AttributeDecl		(void *ctx,
						 const char *elem,
						 const char *fullname,
						 int type,
						 int def,
						 const char *defaultValue,
						 xmlEnumerationPtr tree);
XMLPUBFUN void XMLCALL
		xmlSAX2ElementDecl		(void *ctx,
						 const char *name,
						 int type,
						 xmlElementContentPtr content);
XMLPUBFUN void XMLCALL
		xmlSAX2NotationDecl		(void *ctx,
						 const char *name,
						 const char *publicId,
						 const char *systemId);
XMLPUBFUN void XMLCALL
		xmlSAX2UnparsedEntityDecl	(void *ctx,
						 const char *name,
						 const char *publicId,
						 const char *systemId,
						 const char *notationName);

XMLPUBFUN void XMLCALL
		xmlSAX2StartDocument		(void *ctx);
XMLPUBFUN void XMLCALL
		xmlSAX2EndDocument		(void *ctx);
#if defined(LIBXML_SAX1_ENABLED) || defined(LIBXML_HTML_ENABLED) || \
    defined(LIBXML_WRITER_ENABLED) || defined(LIBXML_DOCB_ENABLED) || \
    defined(LIBXML_LEGACY_ENABLED)
XMLPUBFUN void XMLCALL
		xmlSAX2StartElement		(void *ctx,
						 const char *fullname,
						 const char **atts);
XMLPUBFUN void XMLCALL
		xmlSAX2EndElement		(void *ctx,
						 const char *name);
#endif /* LIBXML_SAX1_ENABLED or LIBXML_HTML_ENABLED or LIBXML_LEGACY_ENABLED */
XMLPUBFUN void XMLCALL
		xmlSAX2StartElementNs		(void *ctx,
						 const char *localname,
						 const char *prefix,
						 const char *URI,
						 int nb_namespaces,
						 const char **namespaces,
						 int nb_attributes,
						 int nb_defaulted,
						 const char **attributes);
XMLPUBFUN void XMLCALL
		xmlSAX2EndElementNs		(void *ctx,
						 const char *localname,
						 const char *prefix,
						 const char *URI);
XMLPUBFUN void XMLCALL
		xmlSAX2Reference		(void *ctx,
						 const char *name);
XMLPUBFUN void XMLCALL
		xmlSAX2Characters		(void *ctx,
						 const char *ch,
						 int len);
XMLPUBFUN void XMLCALL
		xmlSAX2IgnorableWhitespace	(void *ctx,
						 const char *ch,
						 int len);
XMLPUBFUN void XMLCALL
		xmlSAX2ProcessingInstruction	(void *ctx,
						 const char *target,
						 const char *data);
XMLPUBFUN void XMLCALL
		xmlSAX2Comment			(void *ctx,
						 const char *value);
XMLPUBFUN void XMLCALL
		xmlSAX2CDataBlock		(void *ctx,
						 const char *value,
						 int len);

#ifdef LIBXML_SAX1_ENABLED
XMLPUBFUN int XMLCALL
		xmlSAXDefaultVersion		(int version);
#endif /* LIBXML_SAX1_ENABLED */

XMLPUBFUN int XMLCALL
		xmlSAXVersion			(xmlSAXHandler *hdlr,
						 int version);
XMLPUBFUN void XMLCALL
		xmlSAX2InitDefaultSAXHandler    (xmlSAXHandler *hdlr,
						 int warning);
#ifdef LIBXML_HTML_ENABLED
XMLPUBFUN void XMLCALL
		xmlSAX2InitHtmlDefaultSAXHandler(xmlSAXHandler *hdlr);
XMLPUBFUN void XMLCALL
		htmlDefaultSAXHandlerInit	(void);
#endif
#ifdef LIBXML_DOCB_ENABLED
XMLPUBFUN void XMLCALL
		xmlSAX2InitDocbDefaultSAXHandler(xmlSAXHandler *hdlr);
XMLPUBFUN void XMLCALL
		docbDefaultSAXHandlerInit	(void);
#endif
XMLPUBFUN void XMLCALL
		xmlDefaultSAXHandlerInit	(void);
#ifdef __cplusplus
}
#endif
#endif /* __XML_SAX2_H__ */
