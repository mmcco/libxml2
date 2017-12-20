/*
 * Summary: Old SAX version 1 handler, deprecated
 * Description: DEPRECATED set of SAX version 1 interfaces used to
 *              build the DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */


#ifndef __XML_SAX_H__
#define __XML_SAX_H__

#include <stdio.h>
#include <stdlib.h>
#include <libxml/xmlversion.h>
#include <libxml/parser.h>
#include <libxml/xlink.h>

#ifdef LIBXML_LEGACY_ENABLED

#ifdef __cplusplus
extern "C" {
#endif
XMLPUBFUN const char * XMLCALL
		getPublicId			(void *ctx);
XMLPUBFUN const char * XMLCALL
		getSystemId			(void *ctx);
XMLPUBFUN void XMLCALL
		setDocumentLocator		(void *ctx,
						 xmlSAXLocatorPtr loc);

XMLPUBFUN int XMLCALL
		getLineNumber			(void *ctx);
XMLPUBFUN int XMLCALL
		getColumnNumber			(void *ctx);

XMLPUBFUN int XMLCALL
		isStandalone			(void *ctx);
XMLPUBFUN int XMLCALL
		hasInternalSubset		(void *ctx);
XMLPUBFUN int XMLCALL
		hasExternalSubset		(void *ctx);

XMLPUBFUN void XMLCALL
		internalSubset			(void *ctx,
						 const char *name,
						 const char *ExternalID,
						 const char *SystemID);
XMLPUBFUN void XMLCALL
		externalSubset			(void *ctx,
						 const char *name,
						 const char *ExternalID,
						 const char *SystemID);
XMLPUBFUN xmlEntityPtr XMLCALL
		getEntity			(void *ctx,
						 const char *name);
XMLPUBFUN xmlEntityPtr XMLCALL
		getParameterEntity		(void *ctx,
						 const char *name);
XMLPUBFUN xmlParserInputPtr XMLCALL
		resolveEntity			(void *ctx,
						 const char *publicId,
						 const char *systemId);

XMLPUBFUN void XMLCALL
		entityDecl			(void *ctx,
						 const char *name,
						 int type,
						 const char *publicId,
						 const char *systemId,
						 char *content);
XMLPUBFUN void XMLCALL
		attributeDecl			(void *ctx,
						 const char *elem,
						 const char *fullname,
						 int type,
						 int def,
						 const char *defaultValue,
						 xmlEnumerationPtr tree);
XMLPUBFUN void XMLCALL
		elementDecl			(void *ctx,
						 const char *name,
						 int type,
						 xmlElementContentPtr content);
XMLPUBFUN void XMLCALL
		notationDecl			(void *ctx,
						 const char *name,
						 const char *publicId,
						 const char *systemId);
XMLPUBFUN void XMLCALL
		unparsedEntityDecl		(void *ctx,
						 const char *name,
						 const char *publicId,
						 const char *systemId,
						 const char *notationName);

XMLPUBFUN void XMLCALL
		startDocument			(void *ctx);
XMLPUBFUN void XMLCALL
		endDocument			(void *ctx);
XMLPUBFUN void XMLCALL
		attribute			(void *ctx,
						 const char *fullname,
						 const char *value);
XMLPUBFUN void XMLCALL
		startElement			(void *ctx,
						 const char *fullname,
						 const char **atts);
XMLPUBFUN void XMLCALL
		endElement			(void *ctx,
						 const char *name);
XMLPUBFUN void XMLCALL
		reference			(void *ctx,
						 const char *name);
XMLPUBFUN void XMLCALL
		characters			(void *ctx,
						 const char *ch,
						 int len);
XMLPUBFUN void XMLCALL
		ignorableWhitespace		(void *ctx,
						 const char *ch,
						 int len);
XMLPUBFUN void XMLCALL
		processingInstruction		(void *ctx,
						 const char *target,
						 const char *data);
XMLPUBFUN void XMLCALL
		globalNamespace			(void *ctx,
						 const char *href,
						 const char *prefix);
XMLPUBFUN void XMLCALL
		setNamespace			(void *ctx,
						 const char *name);
XMLPUBFUN xmlNsPtr XMLCALL
		getNamespace			(void *ctx);
XMLPUBFUN int XMLCALL
		checkNamespace			(void *ctx,
						 char *nameSpace);
XMLPUBFUN void XMLCALL
		namespaceDecl			(void *ctx,
						 const char *href,
						 const char *prefix);
XMLPUBFUN void XMLCALL
		comment				(void *ctx,
						 const char *value);
XMLPUBFUN void XMLCALL
		cdataBlock			(void *ctx,
						 const char *value,
						 int len);

#ifdef LIBXML_SAX1_ENABLED
XMLPUBFUN void XMLCALL
		initxmlDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr,
						 int warning);
#ifdef LIBXML_HTML_ENABLED
XMLPUBFUN void XMLCALL
		inithtmlDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr);
#endif
#ifdef LIBXML_DOCB_ENABLED
XMLPUBFUN void XMLCALL
		initdocbDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr);
#endif
#endif /* LIBXML_SAX1_ENABLED */

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_LEGACY_ENABLED */

#endif /* __XML_SAX_H__ */
