#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <errno.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>

/* Function Declarations */
int usage();
int checkroot();
int checkconfigured();
int getworking();

int allactions (const char *os);
int backup (const char *os);
int config (const char *os);
int updates (const char *os);
int passwords (const char *os, const char *password);
int policies (const char *os);
int malware (const char *os);
int scans (const char *os);
int updates (const char *os);
int main (int argc, char *argv[]);

/* Global variables */
int configflag = 0;
char *cwd;

int checkroot() {
    if (geteuid()) {
        printf("%s", "This utility must be executed as root!\n");
        abort();
    }
    return 0;
}

int checkconfigured() {
    FILE * configfile;
    configfile = fopen("./configflag", "r");
    if (configfile) {
        configflag = 1;
        fclose(configfile);
        printf("System has been previously configured.\n");
    } else {
        configflag = 0;
        printf("The system has not been configured.\n");
    }
    return 0;
}

int getworking() {
  cwd = getcwd(0,0);
  if (! cwd) {
    fprintf(stderr, "Get working directory failed. %s\n", (char *) strerror(errno));
  }
  return 0;
}

void *thoraciel(void *arg) {
  system("perl thoraciel.pl >> thoraciel.log");
  return NULL;
}

int allactions(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running all actions on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running all actions on %s", os);
    } else if (strcmp(os "fedora") == 0)) {
        printf("Running all actions on %s", os);
    } else if (strcmp(os "gentoo") == 0)) {
        printf("Running all actions on %s", os);
    } else if (strcmp(os "freebsd") == 0)) {
        printf("Running all actions on %s", os);
    } else {
        return 0;
    }
}

int backup(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running backup on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running backup on %s", os);
    } else if (strcmp(os "fedora") == 0)) {
        printf("Running backup on %s", os);
    } else if (strcmp(os "gentoo") == 0)) {
        printf("Running backup on %s", os);
    } else if (strcmp(os "freebsd") == 0)) {
        printf("Running backup on %s", os);
    } else {
        return 0;
    }
}
int config(const char *os) {
    if (strcmp(os, "ubuntu") == 0) {
        printf("Running config on %s", os);
        system("touch ./configflag");
        system("sh ubuntuConfig.sh");
    } else if (strcmp(os "centos") == 0)) {
        printf("Running config on %s", os);
        system("touch ./configflag");
        system("sh centosConfig.sh");
    } else if (strcmp(os "fedora") == 0)) {
        printf("Running config on %s", os);
        system("touch ./configflag");
        system("sh fedoraConfig.sh");
    } else if (strcmp(os "gentoo") == 0)) {
        printf("Running config on %s", os);
        system("touch ./configflag");
        system("sh gentooConfig.sh");
    } else if (strcmp(os "freebsd") == 0)) {
        printf("Running config on %s", os);
        system("touch ./configflag");
        system("sh freebsdConfig.sh");
    } else {
        return 0;
    }
}

int firewall(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running firewall on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running firewall on %s", os);
    } else if (strcmp(os "fedora") == 0)) {
        printf("Running firewall on %s", os);
    } else if (strcmp(os "gentoo") == 0)) {
        printf("Running firewall on %s", os);
    } else if (strcmp(os "freebsd") == 0)) {
        printf("Running firewall on %s", os);
    } else {
        return 0;
    }
}

int passwords(const char *os, const char *password) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running passwords on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running passwords on %s", os);
    } else if (strcmp(os "fedora") == 0) {
        printf("Running passwords on %s", os);
    } else if (strcmp(os "gentoo") == 0) {
        printf("Running passwords on %s", os);
    } else if (strcmp(os "freebsd") == 0) {
        printf("Running passwords on %s", os);
    } else {
        return 0;
    }
}

int policies(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running policies on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running policies on %s", os);
    } else if (strcmp(os "fedora") == 0) {
        printf("Running policies on %s", os);
    } else if (strcmp(os "gentoo") == 0) {
        printf("Running policies on %s", os);
    } else if (strcmp(os "freebsd") == 0) {
        printf("Running policies on %s", os);
    } else {
        return 0;
    }
}

int malware(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running malware on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running malware on %s", os);
    } else if (strcmp(os "fedora") == 0) {
        printf("Running malware on %s", os);
    } else if (strcmp(os "gentoo") == 0) {
        printf("Running malware on %s", os);
    } else if (strcmp(os "freebsd") == 0) {
        printf("Running malware on %s", os);
    } else {
        return 0;
    }
}

int scans(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        pthread_t pth;
        pthread_create(&pth,NULL,thoraciel,NULL);
        printf("Running scans on %s\n", os);
        system("sh ubuntuScans.sh");
        printf("Waiting for thoraciel to complete scans\n");
        pthread_join(pth,NULL);
    } else if (strcmp(os "centos") == 0) {
        printf("Running scans on %s", os);
    } else if (strcmp(os "fedora") == 0) {
        printf("Running scans on %s", os);
    } else if (strcmp(os "gentoo") == 0) {
        printf("Running scans on %s", os);
    } else if (strcmp(os "freebsd") == 0) {
        printf("Running scans on %s", os);
        return 0;
    }
}

int updates(const char *os) {
    if (strcmp(os "ubuntu") == 0) {
        printf("Running updates on %s", os);
    } else if (strcmp(os "centos") == 0) {
        printf("Running updates on %s", os);
    } else if (strcmp(os "fedora") == 0) {
        printf("Running updates on %s", os);
    } else if (strcmp(os "gentoo") == 0) {
        printf("Running updates on %s", os);
    } else if (strcmp(os "freebsd") == 0) {
        printf("Running updates on %s", os);
    } else {
        return 0;
    }
}

/* Prints the usage message and exits the program. */
int usage() {
    printf("Usage:\n"
                   "machariel [OPTIONS]\n"
                   "First run MUST include -c flag\n"
                   "Flags:\n"
                   "-a Performs all actions\n"
                   "-b Backs up key files to specified file\n"
                   "-c Configures machariel for first-time use\n"
                   "-f Configures and enables the firewall\n"
                   "-h Display this message and exit\n"
                   "-p <PASSWORD> Changes all user's passwords to the specified string. USE CAUTION.\n"
                   "-l Configures system policies.\n"
                   "-m Removes many common malwares and searches for certain malicious file types\n"
                   "-o <OS> Allows user to specify operating system from: ubuntu, centos, fedora, gentoo, freebsd\n"
                   "-s <file> Scans the system for common problems and outputs the results to specified file\n"
                   "-u Updates the system, enables automatic updates, and checks the sources list.\n");
    exit(0);
}

int main(int argc, char **argv) {

    checkroot();
    /*Handles not giving any args*/
    if (argc == 1) {
        usage();
    }

    opterr = 0;
    int index;
    int aflag = 0;
    int bflag = 0;
    char *bvalue = NULL;
    int cflag = 0;
    int fflag = 0;
    int hflag = 0;
    int pflag = 0;
    char *pvalue = NULL;
    int lflag = 0;
    int mflag = 0;
    int oflag = 0;
    char *ovalue = NULL;
    int sflag = 0;
    char *svalue = NULL;
    int uflag = 0;
    int c;

    /* Iterates through the arguments and options, sets the corresponding flag to 1 if the arg is passed, sets the corresponding value to the passed string if applicable*/
    while((c = getopt (argc, argv, "ab:cfhp:lmo:s:u:")) != -1)
        switch(c) {
            case 'a' :
                aflag = 1;
                break;
            case 'b' :
                bvalue = optarg;
                break;
            case 'c' :
                cflag = 1;
                break;
            case 'f' :
                fflag = 1;
                break;
            case 'h' :
                hflag = 1;
                break;
            case 'p' :
                pvalue = optarg;
                break;
            case 'l' :
                lflag = 1;
                break;
            case 'm' :
                mflag = 1;
                break;
            case 'o' :
                ovalue = optarg;
                break;
            case 's' :
                svalue = optarg;
                break;
            case 'u' :
                uflag = 1;
                break;
            case '?' :
                if (optopt == 'b' || optopt == 'p' || optopt == 'o' || optopt == 's')
                    fprintf(stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint (optopt))
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                else
                    fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
                return 1;
            default :
                usage();
                abort();
        }

    /* Handles config flag not being set, but system being set to not configure regardless. */
    checkconfigured();
    if (cflag == 0 && configflag == 0) {
        usage();
        abort();
    }

    if (aflag == 1 && ovalue != NULL) {
        allactions(ovalue);
    }

    if (bvalue != NULL && ovalue != NULL && aflag == 0) {
        backup(ovalue);
    }

    if (cflag == 1 && ovalue != NULL && configflag == 0) {
        config(ovalue);
    }

    if (fflag == 1 && ovalue != NULL && aflag != 1 && configflag == 1) {
        firewall(ovalue);
    }

    if (hflag == 1) {
        usage();
    }

    if (pvalue != NULL && ovalue != NULL) {
        passwords(ovalue, pvalue);
    }

    if (lflag == 1 && ovalue != NULL) {
        policies(ovalue);
    }

    if (mflag == 1 && ovalue != NULL) {
        malware(ovalue);
    }

    if (ovalue != NULL) {
        //printf("%s\n", ovalue);
    }

    if (svalue != NULL && ovalue != NULL) {
        scans(ovalue);
    }

    if (uflag == 1 && ovalue != NULL) {
        updates(ovalue);
    }
}
