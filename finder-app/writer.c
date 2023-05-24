#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check if all arguments are specified
    if (argc != 3) {
        fprintf(stderr, "two arguments (a file path, and a text to write to the file) should be supplied.\n");
        exit(EXIT_FAILURE);
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to create the file: %s", writefile);
        perror("fopen");
        exit(EXIT_FAILURE);
    }

    // Write the content to the file
    fputs(writestr, file);

    // Close the file
    fclose(file);

    // Log the success message
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", writestr, writefile);
    closelog();

    return EXIT_SUCCESS;
}
