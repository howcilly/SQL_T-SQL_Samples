--========================================================================
-- Module: MSG_RECIPS.sql
--
-- Purpose: This is a script made to 
--				drop and create the MSG_RECIPS table
--				This table represents all our connect messages for a recipient
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

if not exists (select 1 from information_schema.tables where table_name = 'MSG_RECIPS')
begin
  create table dbo.MSG_RECIPS(
	CONNECT_GRP 				dbo.T_NAM				not null
	,CONNECT_CAT 				dbo.T_NAM				not null
	,CONNECT_MSG_COD		dbo.T_COD				null
	,RECIP_PHONE 				dbo.T_PHONE			not null
	,CUST_NO 						dbo.T_CUST_NO		not null
	,GRP_NAM 						dbo.T_NAM				not null
	--This seq no is based on the created time and date
	,MSG_SEQ_NO		dbo.T_INT		identity(1,1)
	,MSG_COD			dbo.T_COD		null
	,MSG_CAT				dbo.T_COD		null
	--if null then this message is not recurring
	,CONNECT_MSG_IS_RCR			dbo.T_BOOL		null
	,MSG_RCR_TIME						dbo.T_DT			null
	,MSG_RCR_DATE						dbo.T_DT			null
	,CONNECT_MSG_RCR_CAT		dbo.T_COD		null
	--if msg date/time is null then the message has not been sent to the que
	,MSG_SEND_DATE 			dbo.T_DT			null
	,MSG_SEND_TIME 			dbo.T_DT			null
	,RECIP_STOP_MSG			dbo.T_NOTE		null
	,RECIP_MSG_FRM_COD		dbo.T_NOTE		null
	,RECIP_ADD_MSG				dbo.T_NOTE		null
	--if null then the msg has an attachment
	,MSG_HAS_ATT		dbo.T_BOOL		null
	--if null then the msg has no url attachment
	,IS_MSG_ATT_URL		dbo.T_BOOL		null
	,MSG_ATT_URL			dbo.T_URL		null
	--if null then the msg has no image file attachments
	,IS_MSG_ATT_IMG		dbo.T_BOOL		null
	--datatype for img(file type attachments) is associated
	--with the ecommerce img atribute in the IM_ITEM table
	,MSG_RECIPS_ATT			dbo.T_FILENAME50	null
	,LST_MAINT_DT 			dbo.T_DT 		null
	,LST_MAINT_USR_ID 	dbo.T_NAM 		null
	,constraint FK_CONNECT_MSG_RECIPS_GRP foreign key(CONNECT_GRP)
		references dbo.SMS_CONNECT (CONNECT_GRP)
	,constraint FK_RECIP_PHONE foreign key(RECIP_PHONE)
		references dbo.RECIP (RECIP_PHONE)
)
end
go


