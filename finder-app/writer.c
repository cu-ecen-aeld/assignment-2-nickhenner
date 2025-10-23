#include <stdio.h>
#include <syslog.h>
#include <stdlib.h>

int main(int argcount, char *args[]){
	openlog("writer", LOG_PID|LOG_CONS, LOG_USER);

	if (argcount < 2){
		syslog(LOG_ERR, "Not enough arguments provided.");
		return 1;
	}

	FILE *file = fopen(args[1], "a");

	if (file == NULL){
		syslog(LOG_ERR, "Failed to open file: %s", args[1]);
		return 1;
	}	
	
	const char *message = args[2];

	syslog(LOG_INFO, "Writing message to file: %s", message);

	fputs(message, file);
	fclose(file);


	return 0;


}
