/*
 * Summary: set of routines to process strings
 * Description: type and interfaces needed for the internal string handling
 *              of the library, especially UTF8 processing.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_STRING_H__
#define __XML_STRING_H__

#include <stdarg.h>
#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * char handling
 */
XMLPUBFUN char * XMLCALL
                xmlStrndup               (const char *cur,
                                         int len);
XMLPUBFUN char * XMLCALL
                charStrndup           (const char *cur,
                                         int len);
XMLPUBFUN char * XMLCALL
                charStrdup            (const char *cur);
XMLPUBFUN char * XMLCALL
                xmlStrsub                (const char *str,
                                         int start,
                                         int len);
XMLPUBFUN const char * XMLCALL
                xmlStrchr                (const char *str,
                                         char val);
XMLPUBFUN const char * XMLCALL
                xmlStrstr                (const char *str,
                                         const char *val);
XMLPUBFUN const char * XMLCALL
                xmlStrcasestr            (const char *str,
                                         const char *val);
XMLPUBFUN int XMLCALL
                xmlStrcmp                (const char *str1,
                                         const char *str2);
XMLPUBFUN int XMLCALL
                xmlStrncmp               (const char *str1,
                                         const char *str2,
                                         int len);
XMLPUBFUN int XMLCALL
                xmlStrcasecmp            (const char *str1,
                                         const char *str2);
XMLPUBFUN int XMLCALL
                xmlStrncasecmp           (const char *str1,
                                         const char *str2,
                                         int len);
XMLPUBFUN int XMLCALL
                xmlStrEqual              (const char *str1,
                                         const char *str2);
XMLPUBFUN int XMLCALL
                xmlStrQEqual             (const char *pref,
                                         const char *name,
                                         const char *str);
XMLPUBFUN int XMLCALL
                xmlStrlen                (const char *str);
XMLPUBFUN char * XMLCALL
                xmlStrcat                (char *cur,
                                         const char *add);
XMLPUBFUN char * XMLCALL
                xmlStrncat               (char *cur,
                                         const char *add,
                                         int len);
XMLPUBFUN char * XMLCALL
                xmlStrncatNew            (const char *str1,
                                         const char *str2,
                                         int len);
XMLPUBFUN int XMLCALL
                xmlStrPrintf             (char *buf,
                                         int len,
                                         const char *msg,
                                         ...) LIBXML_ATTR_FORMAT(3,4);
XMLPUBFUN int XMLCALL
                xmlStrVPrintf                (char *buf,
                                         int len,
                                         const char *msg,
                                         va_list ap) LIBXML_ATTR_FORMAT(3,0);

XMLPUBFUN int XMLCALL
        xmlGetUTF8Char                   (const unsigned char *utf,
                                         int *len);
XMLPUBFUN int XMLCALL
        xmlCheckUTF8                     (const unsigned char *utf);
XMLPUBFUN int XMLCALL
        xmlUTF8Strsize                   (const char *utf,
                                         int len);
XMLPUBFUN char * XMLCALL
        xmlUTF8Strndup                   (const char *utf,
                                         int len);
XMLPUBFUN const char * XMLCALL
        xmlUTF8Strpos                    (const char *utf,
                                         int pos);
XMLPUBFUN int XMLCALL
        xmlUTF8Strloc                    (const char *utf,
                                         const char *utfchar);
XMLPUBFUN char * XMLCALL
        xmlUTF8Strsub                    (const char *utf,
                                         int start,
                                         int len);
XMLPUBFUN int XMLCALL
        xmlUTF8Strlen                    (const char *utf);
XMLPUBFUN int XMLCALL
        xmlUTF8Size                      (const char *utf);
XMLPUBFUN int XMLCALL
        xmlUTF8Charcmp                   (const char *utf1,
                                         const char *utf2);

#ifdef __cplusplus
}
#endif
#endif /* __XML_STRING_H__ */
