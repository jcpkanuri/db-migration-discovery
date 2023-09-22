REM ====================================================================================================
REM Global SQLPlus setttings
REM ====================================================================================================
SET FEEDBACK OFF
SET LINES 1000
SET PAGESIZE 10000
SET HEADING OFF
SET TERMOUT OFF
SET TRIMSPOOL ON
WHENEVER SQLERROR CONTINUE
SET SERVEROUTPUT ON SIZE 1000000 

REM ====================================================================================================
REM Globals
REM ====================================================================================================
COLUMN DBNAME NEW_VALUE _DBNAME
SELECT SYS_CONTEXT('USERENV','DB_NAME') DBNAME FROM DUAL
/

REM ====================================================================================================
REM SPOOL STARTS HERE
REM ====================================================================================================
SPOOL &&_DBNAME._Code_Complexity_Assessment_Report.html

REM ====================================================================================================
REM HTML Header
REM ====================================================================================================
PROMPT <!doctype html>
PROMPT <HTML lang="en">
PROMPT <HEAD>
PROMPT <META CHARSET="UTF-8">
PROMPT <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/humanity/jquery-ui.css">
PROMPT <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
PROMPT <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
PROMPT <STYLE>
PROMPT       body{
PROMPT                font-family: "Trebuchet MS", sans-serif;;
PROMPT                margin: 0px;;
PROMPT                font-size: 11px;;
PROMPT        }
PROMPT        .pageHeader {
PROMPT                background-color: white;;
PROMPT                background-repeat: no-repeat;;
PROMPT                background-position: left center;;
PROMPT                height: 120px;;
PROMPT                vertical-align: middle;;
PROMPT        }
PROMPT        .repHeader {
PROMPT                color: #e96935;;
PROMPT                font-size: 30px;;
PROMPT                position: absolute;;
PROMPT                left: 200px;;
PROMPT                top: 44px;;
PROMPT        }
PROMPT        table {
PROMPT                border-collapse:collapse;;
PROMPT        }
PROMPT        th {
PROMPT                background-color: #e96935;;
PROMPT                color: white;;
PROMPT        }
PROMPT        td:first-child {  
PROMPT                ackground-color: #f0b07a;;
PROMPT                font-weight: bold;;
PROMPT        }
PROMPT        tbody tr:nth-child(odd){
PROMPT                background-color: #ffd4b0;;
PROMPT        }
PROMPT    }
PROMPT </STYLE>
PROMPT  <script>
PROMPT  $( function() {
PROMPT    $( "#accordion" ).accordion({ collapsible: true, heightStyle: "content" });;
PROMPT  } );;
PROMPT  </script>
PROMPT </HEAD>
PROMPT <BODY>
PROMPT <DIV CLASS="pageHeader">
PROMPT   <DIV CLASS="repHeader">&&_DBNAME. Oracle Database Information Report</DIV>
PROMPT </DIV>

REM ====================================================================================================
REM Report Timestamp
REM ====================================================================================================
SELECT 'Report Runtime - ' || TO_CHAR(SYSDATE,'DD-MON-YYYY HH24:MI:SS') FROM DUAL
/

REM ====================================================================================================
REM Report Body Starts Here
REM ====================================================================================================
PROMPT <div id="accordion">

REM ====================================================================================================
REM BASIC VERSION INFORMATION
REM ====================================================================================================
PROMPT <H3>BASIC VERSION INFORMATION</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
COLUMN BANNER       HEADING "Version Information" FORMAT a60
SELECT INST_ID, BANNER FROM GV$VERSION
/
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM DB Code Complexity Data
REM ====================================================================================================
PROMPT <H3>DB Code Complexity Data</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON

SELECT * FROM (select owner,'connect by' AS Name,count(1) AS NumOfccurrences from dba_source where upper(text) like '%CONNECT%BY%' GROUP BY owner
union all
select owner,'with',count(1) from dba_source where upper(text) like '%WITH%' GROUP BY owner
union all
select owner,'SYSDATE',count(1) from dba_source where upper(text) like '%SYSDATE%' GROUP BY owner
union all
select owner,'SYSTIMESTAMP',count(1) from dba_source where upper(text) like '%SYSTIMESTAMP%' GROUP BY owner
union all
select owner,'ROWID',count(1) from dba_source where upper(text) like '%ROWID%' GROUP BY owner
union all
select owner,'PARTITION BY',count(1) from dba_source where upper(text) like '%PARTITION%BY%' GROUP BY owner
union all
select owner,'DECODE',count(1) from dba_source where upper(text) like '%DECODE%' GROUP BY owner
union all
select owner,'NVL',count(1) from dba_source where upper(text) like '%NVL%' GROUP BY owner
union all
select owner,'NVL2',count(1) from dba_source where upper(text) like '%NVL2%' GROUP BY owner
union all
select owner,'DBMS_SQL',count(1) from dba_source where upper(text) like '%DBMS_SQL%' GROUP BY owner
union all
select owner,'DBMS_SESSION',count(1) from dba_source where upper(text) like '%DBMS_SESSION%' GROUP BY owner
union all
select owner,'BULK COLLECT',count(1) from dba_source where upper(text) like '%BULK%COLLECT%' GROUP BY owner
union all
select owner,'DBMS_SESSION',count(1) from dba_source where upper(text) like '%DBMS_SESSION%' GROUP BY owner
union all
select owner,'EXECUTE IMMEDIATE',count(1) from dba_source where upper(text) like '%EXECUTE%IMMEDIATE%' GROUP BY owner
union all
select owner,'TYPE',count(1) from dba_source where upper(text) like '%TYPE%' GROUP BY owner
union all
select owner,'OBJECT',count(1) from dba_source where upper(text) like '%OBJECT%' GROUP BY owner
union all
select owner,'XMLTYPE',count(1) from dba_source where upper(text) like '%XMLTYPE%' GROUP BY owner
union all
select owner,'CLOB',count(1) from dba_source where upper(text) like '%CLOB%' GROUP BY owner
union all
select owner,'BLOB',count(1) from dba_source where upper(text) like '%BLOB%' GROUP BY owner
union all
select owner,'numtodsinterval',count(1) from dba_source where upper(text) like '%NUMTODSINTERVAL%' GROUP BY owner
union all
select owner,'UTL_FILE',count(1) from dba_source where upper(text) like '%UTL_FILE%' GROUP BY owner
union all
select owner,'PIPE',count(1) from dba_source where upper(text) like '%PIPE%' GROUP BY owner
union all
select owner,'FORALL',count(1) from dba_source where upper(text) like '%FORALL%' GROUP BY owner
UNION ALL
select owner,'UTL_SMTP',count(1) from dba_source where upper(text) like '%UTL_SMTP%' GROUP BY owner
UNION ALL
select owner,'UTL_FILE',count(1) from dba_source where upper(text) like '%AUTONOMOUS%' GROUP BY owner
UNION ALL
select owner,'DBMS_AQ',count(1) from dba_source where upper(text) like '%DBMS_AQ%' GROUP BY owner
UNION ALL
select owner,'PIPELINED',count(1) from dba_source where upper(text) like '%PIPELINED%' GROUP BY owner
UNION ALL
select owner,'ROWTYPE',count(1) from dba_source where upper(text) like '%ROWTYPE%' GROUP BY owner) x
WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL');


REM ====================================================================================================
REM Number of Lines of Code in PL/SQL
REM ====================================================================================================
PROMPT <H3>Number of Lines of Code in PL/SQL</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON

SELECT owner,name,type,count(1) Num_of_lines_code
  FROM dba_source x
 WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS')
GROUP BY  owner,name,type;

SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM Advanced Queues
REM ====================================================================================================
PROMPT <H3>Advanced Queues</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
SELECT * FROM DBA_QUEUES x
WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS');
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM Advanced Queue Schedules
REM ====================================================================================================
PROMPT <H3>Advanced Queue Schedules</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
SELECT * FROM DBA_QUEUE_SCHEDULES x
WHERE x.schema NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.schema NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS');
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM Advanced Queues Tables
REM ====================================================================================================
PROMPT <H3>Advanced Queue Tables</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
SELECT * FROM DBA_QUEUE_TABLES x
WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS');
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM DBA Dependencies
REM ====================================================================================================
PROMPT <H3>DBA Dependencies</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
SELECT * FROM DBA_DEPENDENCIES x
WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS');
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM PDB DAtabase Size
REM ====================================================================================================
PROMPT <H3>Pluggable Database Size</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
select con_id, name, open_mode, total_size/1024/1024/1024 "PDB_SIZE_GB" from v$pdbs;
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>

REM ====================================================================================================
REM Database Object Size Summary
REM ====================================================================================================
PROMPT <H3>Database Object Size Summary</H3>
PROMPT <DIV><P>
SET MARKUP HTML ON
SET HEADING ON
select OWNER,segment_type,sum(bytes)/1024/1024/1024 SIZE_IN_GB from dba_segments x
WHERE x.owner NOT IN ('ANONYMOUS','APEX_030200','APEX_040000','APEX_040200','APEX_180200','APEX_SSO','APPQOSSYS','CTXSYS','DBSNMP','DIP','EXFSYS','FLOWS_FILES','MDSYS','OLAPSYS','ORACLE_OCM','ORDDATA','ORDPLUGINS','ORDSYS','OUTLN','OWBSYS')
   AND x.owner NOT IN ('SI_INFORMTN_SCHEMA','SQLTXADMIN','SQLTXPLAIN','SYS','SYSMAN','SYSTEM','TRCANLZR','WMSYS','XDB','XS$NULL','PERFSTAT','STDBYPERF','MGDSYS','OJVMSYS','GSMADMIN_INTERNAL',
                       'AUDSYS','DBSFWUSER','REMOTE_SCHEDULER_AGENT','LBACSYS','DVF','DVSYS')
group by owner,segment_type order by owner,2 DESC;
SET MARKUP HTML OFF
SET HEADING OFF
PROMPT </P></DIV>