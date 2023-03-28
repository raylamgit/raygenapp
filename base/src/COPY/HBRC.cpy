      ** Completion codes
         10 HBR-CC-OK PIC S9(9) BINARY VALUE 0.
         10 HBR-CC-WARNING PIC S9(9) BINARY VALUE 4.
         10 HBR-CC-ERROR PIC S9(9) BINARY VALUE 8.
         10 HBR-CC-SEVERE PIC S9(9) BINARY VALUE 12.
      ** Reason codes
      ** The call completed normally.
         10 HBR-RC-NONE PIC S9(9) BINARY VALUE 0.
      ** An unexpected error occurred.
         10 HBR-RC-UNEXPECTED PIC S9(9) BINARY VALUE 2195.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRBCON PIC S9(9) BINARY VALUE 3001.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRCCON PIC S9(9) BINARY VALUE 3002.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRBDSC PIC S9(9) BINARY VALUE 3003.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRCDSC PIC S9(9) BINARY VALUE 3004.
      ** The subsystem specified by the HBRSSID variable in
      ** the HBRENVPR data set is not defined to z/OS.
         10 HBR-RC-SERVER-NOT-DEFINED PIC S9(9) BINARY VALUE 3005.
      ** The subsystem specified by the HBRSSID variable in
      ** the HBRENVPR data set is not active.
         10 HBR-RC-SERVER-NOT-ACTIVE PIC S9(9) BINARY VALUE 3006.
      ** A parameter is incorrectly specified in the HBRA-R
      ** A-PARMS structure in the HBRA-CONN-AREA data area.
      ** The number of the invalid parameter is returned
      ** in the HBRA-RESPONSE-MESSAGE field of the HBRA-CON
      ** N-AREA data area.
         10 HBR-RC-INVALID-NUMBER-PARMS PIC S9(9) BINARY VALUE 3007.
      ** The subsystem specified by the HBRSSID variable in
      ** the HBRENVPR data set is already in use.
         10 HBR-RC-SERVER-ID-INVALID PIC S9(9) BINARY VALUE 3008.
      ** The server is unable to accept work because it is
      ** paused.
         10 HBR-RC-NOT-ACCEPTING-WORK PIC S9(9) BINARY VALUE 3009.
      ** The CICS version used to connect to the server is
      ** unsupported. zRule Execution Server for z/OS suppo
      ** rts only CICS version 3.2, 4.1, and 4.2.
         10 HBR-RC-ERROR-INVALID-CICS PIC S9(9) BINARY VALUE 3010.
      ** The version of CICS used with HBRUSEJVMS=YES is un
      ** supported. The HBRUSEJVMS=YES parameter is support
      ** ed only on CICS TS version 4.1 or later.
         10 HBR-RC-INVALID-JVMS-RELEASE PIC S9(9) BINARY VALUE 3011.
      ** An attempt to obtain storage has failed. There is
      ** not enough storage available to complete the reque
      ** st.
         10 HBR-RC-ERROR-STORAGE-FAIL PIC S9(9) BINARY VALUE 3012.
      ** The connection to JVM Server HBRJVM has failed as
      ** the JVM Server is not installed.
         10 HBR-RC-CICS-NO-JVMSERVER PIC S9(9) BINARY VALUE 3013.
      ** The connection to JVM Server HBRJVM has failed as
      ** the JVM Server is not enabled.
         10 HBR-RC-CICS-NOTENABLED-JVMS PIC S9(9) BINARY VALUE 3014.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRICON PIC S9(9) BINARY VALUE 3015.
      ** Unable to load Decision Server load modules.
         10 HBR-RC-ERROR-HBRIDSC PIC S9(9) BINARY VALUE 3016.
      ** The code page specified in HBRA_CONN_RULE_CCSID is
      ** invalid.
         10 HBR-RC-ERROR-INVALID-CCSID PIC S9(9) BINARY VALUE 3017.
      ** A HBRSSIDLIST value is missing in a data set specif
      ** ied by the HBRENVPR DD card.
         10 HBR-RC-MISSING-HBRSSIDLIST PIC S9(9) BINARY VALUE 3018.
      ** The HBRSSIDLIST value is incorrect. Please provide
      ** a comma separated list of up to 32 SSIDs of 4 cha
      ** racters e.g. HBR1,HBR2,HBR3
         10 HBR-RC-INVALID-HBRSSIDLIST PIC S9(9) BINARY VALUE 3019.
      ** No valid zRule Execution Server was found in the H
      ** BRSSIDLIST property.
         10 HBR-RC-NO-VALID-SERVER-CONN PIC S9(9) BINARY VALUE 3020.
      ** A zRule Execution Server in the HBRSSIDLIST proper
      ** ty could not be connected to.
         10 HBR-RC-WARNING-SERVER-LIST PIC S9(9) BINARY VALUE 3021.
      ** No valid zRule Execution Server was found to execu
      ** te the rule request.
         10 HBR-RC-NO-VALID-SERVER-RULE PIC S9(9) BINARY VALUE 3022.
      ** Could not open HBRENVPR which is defined in the HB
      ** RENVPR DD statement in the CICS JCL.
         10 HBR-RC-INVALID-CICS-ENV-DD PIC S9(9) BINARY VALUE 3023.
      ** The user ID of the application issuing the HBRCONN
      ** API call is not authorized to connect to the serv
      ** er.
         10 HBR-RC-CONN-NOT-AUTH PIC S9(9) BINARY VALUE 4035.
      ** Missing Ruleapp name.
         10 HBR-RC-MISSING-RA-NAME PIC S9(9) BINARY VALUE 4084.
      ** Invalid Ruleapp name.
         10 HBR-RC-INVALID-RA-NAME PIC S9(9) BINARY VALUE 4085.
      ** CICS is not connected to zRule Execution Server fo
      ** r z/OS.
         10 HBR-RC-ADAPTER-NOT-AVAILABLE PIC S9(9) BINARY VALUE 4086.
      ** The HBRC structure in the HBRA-CONN-AREA data area
      ** passed either to the HBRCONN API or the HBRRULE A
      ** PI is invalid or contains invalid data.
         10 HBR-RC-INVALID-HBRC PIC S9(9) BINARY VALUE 4087.
      ** The user ID is already connected to the server. Th
      ** e user ID is passed back in the HBRA-RESPONSE-MESS
      ** AGE field of the HBRA-CONN-AREA data area.
         10 HBR-RC-ALREADY-CONNECTED PIC S9(9) BINARY VALUE 4088.
      ** A HBRSSID value is missing in a data set specified
      ** by the HBRENVPR DD card.
         10 HBR-RC-MISSING-HBRSSID PIC S9(9) BINARY VALUE 4089.
      ** The application is not connected to the server.
         10 HBR-RC-NOT-CONNECTED PIC S9(9) BINARY VALUE 4090.
      ** An unexpected exception occurred in the JRules eng
      ** ine.
         10 HBR-RC-JRULES-UNEXPECTED PIC S9(9) BINARY VALUE 5000.
      ** An exception occurred in the JRules engine.
         10 HBR-RC-JRULES-EXCEPTION PIC S9(9) BINARY VALUE 5001.
      ** An exception occurred converting the parameter dat
      ** a.
         10 HBR-RC-RAW-DATA-EXCEPTION PIC S9(9) BINARY VALUE 5002.
      ** An exception occurred parsing the rule application
      ** path.
         10 HBR-RC-ILR-FORMAT-EXCEPTION PIC S9(9) BINARY VALUE 5003.
      ** Unable to load WOLA load modules.
         10 HBR-RC-WOLA-LOAD PIC S9(9) BINARY VALUE 6000.
      ** The WAS server specified by HBRWOLASERVER cannot b
      ** e located.
         10 HBR-RC-WOLA-BAD-DAEMON-GROUP PIC S9(9) BINARY VALUE 6001.
      ** The node name or server name is not found.
         10 HBR-RC-WOLA-BAD-CELL-OR-NODE PIC S9(9) BINARY VALUE 6002.
      ** An error occurred while connecting to WAS.
         10 HBR-RC-WOLA-WAS-ERROR PIC S9(9) BINARY VALUE 6003.
      ** The WOLA EJB could not be found.
         10 HBR-RC-WOLA-EJB-NOT-FOUND PIC S9(9) BINARY VALUE 6004.