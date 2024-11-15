#include <fcgiapp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

int main() {

	printf("Hello.\n");

	FCGX_Init();
	int Socket = FCGX_OpenSocket("127.0.0.1:2016", 1024);
int ilen;
	FCGX_Request Request;
	FCGX_InitRequest(&Request, Socket, 0);
	
	// add this loop:

	while(FCGX_Accept_r(&Request) >= 0) {
		printf("Request accepted.\n");
        char *qstr = FCGX_GetParam("REQUEST_URI", Request.envp);
        if (!strcmp(qstr, "/foo1")) {
            printf("REQUEST zwrotny %s\n", qstr);
            FCGX_FPrintF(
			    Request.out,
			    "Content-type: text/html\r\n\r\n"
			    "<h1>Hello.</h1>"
			);
            FCGX_Finish_r(&Request);
        }
        else if (!strcmp(qstr, "/foo2")) {
            printf("REQUEST zwrotny %s\n", qstr);
            FCGX_FPrintF(
			    Request.out,
			    "Content-type: text/html\r\n\r\n"
			    "<h1>Hello.</h1>"
			);
            FCGX_Finish_r(&Request);
        }
        else if (!strcmp(qstr, "/dali-val")) {

            char * method = FCGX_GetParam("REQUEST_METHOD", Request.envp);
            if (!strcmp(method, "POST")) {
                ilen = atoi(FCGX_GetParam("CONTENT_LENGTH", Request.envp));
                printf("length-value= %d\n", ilen);
                char pstr[10] = {0};
                FCGX_GetStr(pstr, ilen, Request.in);
                printf("val=%s\n", pstr );
            }            
            //printf("dimmer-value= %s\n", qstr_post);
            FCGX_FPrintF(
			    Request.out,
			    "Content-type: text/html\r\n\r\n"
			    "<h1>Hello.</h1>"
			);
            FCGX_Finish_r(&Request);
        }

//        char **env = Request.envp;
//        while (*(++env))
//            printf("%s", *env);

//		char Title[64] = {0};
//        memset(Title, 0, 64);
//		
//		if(strncmp(qstr, "/foo1", 110) == 0) {
//			strcpy(Title, "Home");
//		} else if(strncmp(qstr, "/GetTxCount", 110) == 0) {
//			strcpy(Title, "About");
//		} else {
//			strcpy(Title, "404 Not Found\n");
//		}
//
//        printf("String zwrotny %s", Title);
//		
//        FCGX_FPrintF(
//			Request.out,
//			"Content-type: text/html\r\n\r\n"
//			"<h1>Hello.</h1>"
//			);
//		FCGX_Finish_r(&Request);
	}
	
	return 0;
}
