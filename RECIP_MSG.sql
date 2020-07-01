--========================================================================
-- Module: RECIP_MSG.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_MSG table
--				This table represents all our recipients messages in a sequence according to creation date
--
-- Table Type: Initially this is not a work table but after creation it becomes a source for a work table
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_MSG')
begin
  create table dbo.RECIP_MSG(
	RECIP_PHONE 		dbo.T_PHONE		not null
	,CUST_NO 			dbo.T_CUST_NO	not null
	,RECIP_NAM 		dbo.T_NAM			not null
	--This seq no is based on the created time and date
	,MSG_SEQ_NO		dbo.T_INT		identity(1,1)
	--null due to the stop message addition trigger that is called on insertion/update of a new record
	,RECIP_MSG_TO_SEND 		dbo.T_NOTE		null
	,MSG_COD						dbo.T_COD		null
	,MSG_CAT							dbo.T_NAM		null
	,MSG_RCR_TIME				dbo.T_DT			null
	,MSG_RCR_DATE				dbo.T_DT			null
	,MSG_RCR_CAT				dbo.T_NAM		null
	--if msg date/time is null then the message has not been sent to the que
	,RECIP_MSG_SEND_DATE 		dbo.T_DT			null
	,RECIP_MSG_SEND_TIME 		dbo.T_DT			null
	,RECIP_STOP_MSG				dbo.T_NOTE		null
	,RECIP_MSG_FRM_COD			dbo.T_NOTE		null
	,RECIP_ADD_MSG					dbo.T_NOTE		null
	--if null then the msg has an attachment
	,MSG_HAS_ATT		dbo.T_BOOL		null
	--if null then the msg has no url attachment
	,IS_MSG_ATT_URL		dbo.T_BOOL		null
	,MSG_ATT_URL			dbo.T_URL		null
	--if null then the msg has no image file attachments
	,IS_MSG_ATT_IMG		dbo.T_BOOL		null
	--datatype for img(file type attachments) is associated
	--	with the ecommerce img atribute in the IM_ITEM table
	,RECIP_MSG_ATT			dbo.T_FILENAME50		null
	,RECIP_TYP 					dbo.T_FLG2					null
	,RECIP_CITY 					dbo.T_CITY					null
	,RECIP_STATE 				dbo.T_STATE				null
	,RECIP_ZIP_COD 			dbo.T_ZIP_COD			null
	,RECIP_URL_DASH 		dbo.T_URL					null
	,RECIP_CATEG_COD 		dbo.T_COD					null
	,RECIP_MSG_GRP			dbo.T_NAM					null
	--if null then the user is not opted out and we can send messages to them
	,RECIP_OPTED_OUT 		dbo.T_FLG	null
	--if null then the recipient has no inbox messages in the bandwidth get request of sms incoming
	--else then reference the RECIP_MSG_INBOX table
	,RECIP_HAS_INBOX 		dbo.T_FLG		null
	--This seq no is based on the inbox received time and date
	,LST_MAINT_DT 			dbo.T_DT 		null
	,LST_MAINT_USR_ID 	dbo.T_NAM 		null
	,constraint FK_RECIP_MSG foreign key(RECIP_PHONE)
	references dbo.RECIP (RECIP_PHONE)
	)
end
go


