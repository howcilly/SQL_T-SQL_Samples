--========================================================================
-- Module: RECIP_MSG_INBOX.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_MSG_INBOX table
--				This table represents all our messages in the inbox and only exists if the recipient has an inbox
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_INBOX_MSG')
begin
  create table dbo.RECIP_INBOX_MSG (
  --This seq no is based on the inbox time and date
	RECIP_IN_MSG_SEQ_NO 		dbo.T_INT			identity(1,1)
	,RECIP_PHONE 					dbo.T_PHONE 		not null
	,CUST_NO 							dbo.T_CUST_NO	not null
	,RECIP_NAM 						dbo.T_NAM 			not null
	,RECIP_IN_MSG 					dbo.T_NOTE			null
	--if null then the msg has an attachment
	,MSG_HAS_ATT		dbo.T_BOOL		null
	--if null then the msg has no url attachment
	,IS_MSG_ATT_URL		dbo.T_BOOL		null
	,MSG_ATT_URL			dbo.T_URL		null
	--if null then the msg has no image file attachments
	,IS_MSG_ATT_IMG		dbo.T_BOOL		null
	--datatype for img(file type attachments) is associated
	--	with the ecommerce img atribute in the IM_ITEM table
	,CONNECT_MSG_ATT		dbo.T_FILENAME50		null
	,RECIP_IN_MSG_TIME 		dbo.T_DT					null
	,RECIP_IN_MSG_DATE 		dbo.T_DT					null
	,RECIP_TYP 						dbo.T_FLG2				null
	,RECIP_CITY 						dbo.T_CITY				null
	,RECIP_STATE 					dbo.T_STATE			null
	,RECIP_ZIP_COD 				dbo.T_ZIP_COD		null
	,RECIP_CATEG_COD 			dbo.T_COD				null
	--if null then the user is not opted out and we can send messages to them
	,RECIP_OPTED_OUT 			dbo.T_FLG		null
	,RECIP_LST_MSG_SENT 	dbo.T_NOTE		null --most recent msg in inbox
	,LST_MAINT_DT 				dbo.T_DT 		null
	,LST_MAINT_USR_ID 		dbo.T_NAM 		null
	,constraint FK_RECIP_INBOX_MSG foreign key(RECIP_PHONE)
	references dbo.RECIP (RECIP_PHONE)
)
end
go


