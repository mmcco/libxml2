/**
 * section: InputOutput
 * synopsis: Output to char buffer
 * purpose: Demonstrate the use of xmlDocDumpMemory
 *          to output document to a character buffer
 * usage: io2
 * test: io2 > io2.tmp && diff io2.tmp $(srcdir)/io2.res
 * author: John Fleck
 * copy: see Copyright for the status of this software.
 */

#include <libxml/parser.h>

#if defined(LIBXML_TREE_ENABLED) && defined(LIBXML_OUTPUT_ENABLED)
int
main(void)
{

    xmlNodePtr n;
    xmlDocPtr doc;
    char *xmlbuff;
    int buffersize;

    /*
     * Create the document.
     */
    doc = xmlNewDoc("1.0");
    n = xmlNewNode(NULL, "root");
    xmlNodeSetContent(n, "content");
    xmlDocSetRootElement(doc, n);

    /*
     * Dump the document to a buffer and print it
     * for demonstration purposes.
     */
    xmlDocDumpFormatMemory(doc, &xmlbuff, &buffersize, 1);
    printf("%s", (char *) xmlbuff);

    /*
     * Free associated memory.
     */
    free(xmlbuff);
    xmlFreeDoc(doc);

    return (0);

}
#else
#include <stdio.h>

int
main(void)
{
    fprintf(stderr,
            "library not configured with tree and output support\n");
    return (1);
}
#endif
