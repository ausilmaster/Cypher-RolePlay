/**
 * <library name="log" 
 *          version="1.0" 
 *          description="Adds better logging functions to PAWN with different log levels."
 *          author="dy1zan" author_url="https://github.com/dy1zan"
 * >
 * 
 * <section>
 *      Log levels
 * </section>
 * <ul>
 *      <symbol name="LOGL_DEBUG">Debug</symbol>
 *      <symbol name="LOGL_INFO">Information</symbol>
 *      <symbol name="LOGL_WARNING">Warning</symbol>
 *      <symbol name="LOGL_ERROR">Error</symbol>
 * </ul>
 * <section>
 *      Functions
 * </section>
 * <ul>
 *      <symbol name="log_level">Defines the log level to use.</symbol>
 *      <symbol name="log_debug">Prints a debug message if the log level is set to LOGL_DEBUG.</symbol>
 *      <symbol name="log_info">Prints an information message.</symbol>
 *      <symbol name="log_warning">Prints a warning message with a backtrace.</symbol>
 *      <symbol name="log_error">Prints an error message with a backtrace, and if DEVMODE is defined as "1", shutdowns the server.</symbol>
 * </ul>
 * <section>
 *      Examples
 * </section>
 * <subsection>
 *      Debug messages
 * </subsection>
 * <p>The following sets the log level (ideally in OnScriptInit()), and then prints a debug message.
 * <code>
 * Log:level(LOGL_DEBUG);<br />
 * Log:debug("vehicles.inc", "Created %p's vehicle (%s) with vehicle SQL ID=%d", playerid, vehiclename, sqlid);
 * </code>
 * </p>
 *
 * </library>
 *//** */

#if defined _log_included
	#endinput
#endif
#define _log_included

// Dependencies
#include <a_samp>
#include <crashdetect>
#include <formatex>
#include <YSI\y_va>

 
 // Define the namespace
#define Log:    log_


// Definitions
#define MAX_LOG_LENGTH  512

enum {
    LOGL_DEBUG = 1,
    LOGL_INFO,
    LOGL_WARNING,
    LOGL_ERROR,
    LOGL_NONE
}

static LOG_LEVEL = LOGL_DEBUG;

// Forward declarations
forward Log:level(level);
forward Log:debug(prefix[], text[], va_args<>);
forward Log:info(prefix[], text[], va_args<>);
forward Log:warning(prefix[], text[], va_args<>);
forward Log:error(prefix[], text[], va_args<>);


public Log:level(level) {
    LOG_LEVEL = level;
    Log:info("log.inc", "The log level has been set to %d.", level);
}


/*------------------------------------------------------------*//**
 * <remarks>
 *      Prints a debug message in the console/log. This is later to
 *      be changed to print to a new file, instead of server_log.txt
 * </remarks>
 * <seealso name="log"/>
*//*------------------------------------------------------------**/
public Log:debug(prefix[], text[], {Float,_}:...) {

    if(LOG_LEVEL != LOGL_DEBUG) {
        return;
    }

    new
        out[MAX_LOG_LENGTH]
    ;
    formatex(out, _, text, ___(2));
    formatex(out, _, "DEBUG [%s]: %s", prefix, out);
    print(out);
}

/*------------------------------------------------------------*//**
 * <remarks>Prints an informative message in the console/log.</remarks>
 * <seealso name="log"/>
*//*------------------------------------------------------------**/
public Log:info(prefix[], text[], {Float,_}:...) {
    if(LOG_LEVEL > LOGL_INFO) {
        return;
    }

    new
        out[MAX_LOG_LENGTH]
    ;
    formatex(out, _, text,  ___(2));
    formatex(out, _, "INFO [%s]: %s", prefix, out);
    print(out);
}

/*------------------------------------------------------------*//**
 * <remarks>Prints a warning message in the console/log.</remarks>
 * <seealso name="log"/>
*//*------------------------------------------------------------**/
public Log:warning(prefix[], text[], {Float,_}:...) {
    if(LOG_LEVEL > LOGL_WARNING) {
        return;
    }

    new 
        out[MAX_LOG_LENGTH]
    ;
    formatex(out, _, text, ___(2));
    formatex(out, _, "WARNING [%s]: %s", prefix, out);

    print(out);
    PrintAmxBacktrace();
}

/*------------------------------------------------------------*//**
 * <remarks>
 *      Prints an error message in the console/log. If DEVMODE is defined as <i>1</i>,
 *      this will shutdown the server
 * </remarks>
 * <seealso name="log"/>
*//*------------------------------------------------------------**/

public Log:error(prefix[], text[], {Float,_}:...) {
    if(LOG_LEVEL > LOGL_ERROR) {
        return;
    }

    new
        out[MAX_LOG_LENGTH]
    ;
    formatex(out, _, text, ___(2));
    formatex(out, _, "ERROR [%s]: %s", prefix, out);

    print(out);
    PrintAmxBacktrace();

    #if defined DEVMODE
    #if DEVMODE == 1
    //Generate crash, credits to Southclaws
    new File:f = fopen("nonexistentfile", io_read), tmp[1];
    fread(f, tmp);
    fclose(f);
    #endif
    #endif
}