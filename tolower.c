/**
    @file   tolower.c
    @brief  Recursively converts all file-names to lower-case.

    Copyright &copy; 2002 by Josef Pelikan, MFF UK Prague
    http://cgg.ms.mff.cuni.cz/~pepca/
    @since  21.8.2002
    @date   19.10.2002
*/

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>

int verbose = 0;

int convertDirectory ( const char *name )
    /* returns number of converted file-names, -1 if failed */
{
    DIR *dir;
    char fn[2048], oldFn[2048], *ptr;
    int len, rw, counter, needs, subCounter;
    struct dirent *entry;
    struct stat st;

    if ( !name || !name[0] ) return -1;
    dir = opendir(name);
    if ( !dir ) return -1;
    strcpy(fn,name);
    len = strlen(fn);
    fn[len++] = '/';
    rw = 0;                                 /* the directory is writtable? */
    counter = 0;                            /* number of changed file-names */
    while ( (entry = readdir(dir)) ) {      /* process one directory entry */
        if ( entry->d_name[0] == '.' &&
             (!entry->d_name[1] ||
              entry->d_name[1] == '.' &&
              !entry->d_name[2]) )
            continue;                       /* special directory */
            /* assemble the item name: */
        strcpy(fn+len,entry->d_name);
            /* lower-case conversion: */
        needs = 0;
        for ( ptr = fn + len; *ptr; ptr++ )
            if ( isupper(*ptr) ) {
                needs = 1;
                break;
                }
            /* the directory-entry needs to be converted: */
        if ( needs ) {
            if ( !rw ) {                    /* make the mother directory writable */
                fn[len-1] = (char)0;
                if ( !stat(fn,&st) && !(st.st_mode & S_IWUSR) )
                    chmod(fn,st.st_mode|S_IWUSR);
                fn[len-1] = '/';
                rw = 1;
                }
            strcpy(oldFn,fn);
            for ( ptr = fn + len; *ptr; ptr++ )
                if ( isupper(*ptr) )
                    *ptr = tolower(*ptr);
            rename(oldFn,fn);
            if ( verbose ) printf("%s -> %s\n",oldFn,fn);
            counter++;
            }
            /* stat the entry .. subdirectories must be traversed */
        if ( !stat(fn,&st) &&
             S_ISDIR(st.st_mode) ) {        /* directory */
            subCounter = convertDirectory(fn);
            if ( subCounter >= 0 )
                counter += subCounter;
            else
                if ( verbose )
                    printf("Error converting '%s' directory\n",fn);
            }
        }
    closedir(dir);
    
    return counter;
}

int main ( int argc, char *argv[] )
{
    /* TODO: command-line argument: directory to convert */
    /* TODO: -v (verbose) */
    int converted = convertDirectory(".");
    if ( converted <= 0 )
        printf("No file-names were converted\n");
    else
        printf("%d file-names were converted\n",converted);
    return 0;
}
