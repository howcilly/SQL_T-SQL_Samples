--========================================================================
-- Module: RECIP_OPT_OUT.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_OPT_OUT table
--				This table is used to contain all opted out users
--
-- Table Type: Initially this is not a work table but after creation it becomes a work table
--
-- Triggers: This table has the following triggers associated with it
--
-- History/Change Log: After Release Keep track of any changes why they
--						were made and where they were made
-- 
--========================================================================
-- Author(s): Ron Espinoza
--========================================================================
-- Copyright © Mariner Business Solutions 2018
--========================================================================
set ansi_nulls on
go

set quoted_identifier on
go

set ansi_padding on
go

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_OPT_OUT')
begin
  create table dbo.RECIP_OPT_OUT (
	RECIP_PHONE 				dbo.T_PHONE 		not null
	,CUST_NO 					dbo.T_CUST_NO	not null
	,RECIP_NAM 				dbo.T_NAM 			not null
	,RECIP_TYP 					dbo.T_FLG2			null
	,RECIP_CITY 					dbo.T_CITY			null
	,RECIP_STATE 				dbo.T_STATE		null
	,RECIP_ZIP_COD 			dbo.T_ZIP_COD	null
	,RECIP_CATEG_COD 		dbo.T_COD			null
	--if null then the user is not opted out and we can send messages to them
	,RECIP_OPTED_OUT 				dbo.T_FLG		null
	,RECIP_LST_MSG_SENT 		dbo.T_NOTE		null
	,RECIP_LST_MSG_SENT_DT 	dbo.T_DT			null
	,RECIP_LST_TKT_DT 				dbo.T_DT			null
	--if null then the recipient has no inbox messages in the bandwidth get request of sms incoming
	--else then reference the RECIP_MSG_INBOX table
	,RECIP_HAS_INBOX 						dbo.T_FLG		not null
	,RECIP_MSGwSTOP_FRM_INBX		dbo.T_NOTE		not null
	,RECIP_LST_MSGwSTOP_SENT_DT dbo.T_DT			null
	,LST_MAINT_DT 							dbo.T_DT			null
	,LST_MAINT_USR_ID 					dbo.T_NAM		null
	,constraint FK_RECIP_OPT_OUT foreign key(RECIP_PHONE)
	references dbo.RECIP (RECIP_PHONE)
)
end
go	


