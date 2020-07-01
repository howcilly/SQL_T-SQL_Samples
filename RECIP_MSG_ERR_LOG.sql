--========================================================================
-- Module: RECIP_MSG_ERR_LOG.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_MSG_ERR_LOG table
--				This table represents all error messages from unsent messages
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_MSG_ERR_LOG')
begin
  create table dbo.RECIP_MSG_ERR_LOG (
	RECIP_PHONE 						dbo.T_PHONE 			not null
	,CUST_NO 							dbo.T_CUST_NO		not null
	,RECIP_NAM 						dbo.T_NAM 				not null
	,RECIP_ERR_MSG 					dbo.T_NOTE				null
	--this is the restful api error code returned from the HTTP header in the C# HTTP_CLIENT class
	,MSG_ERR_COD 					VARCHAR(8)	not null
	,RECIP_MSG_SENT_DATE 		dbo.T_DT					null
	,RECIP_MSG_SENT_TIME 		dbo.T_DT					null
	,LST_MAINT_DT 					dbo.T_DT 				null
	,LST_MAINT_USR_ID 			dbo.T_NAM 				null
	,constraint FK_RECIP_MSG_ERR_LOG foreign key(RECIP_PHONE)
	references dbo.RECIP (RECIP_PHONE)
)
end
go


