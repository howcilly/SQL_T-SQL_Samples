--========================================================================
-- Module: RECIP_MSG_QUE.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_MSG_QUE table
--				This table represents all our messages in the outgoing que
--				
-- Table Type: Initially this is not a work table but after creation it becomes a work table for the SQL server
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_MSG_QUE')
begin
  create table dbo.RECIP_MSG_QUE (
	RECIP_PHONE 						dbo.T_PHONE 			not null
	--This seq no is based on the inbox received time and date
	,MSG_SEQ_NO						dbo.T_INT				null
	,CUST_NO 							dbo.T_CUST_NO		not null
	,RECIP_NAM 						dbo.T_NAM 				not null
	,RECIP_MSG_TO_SEND 			dbo.T_NOTE				not null
	,RECIP_MSG_SEND_DATE 		dbo.T_DT					not null
	,RECIP_MSG_SEND_TIME 		dbo.T_DT					not null
	,RECIP_STOP_MSG				dbo.T_NOTE				null
	,RECIP_MSG_FRM_COD			dbo.T_NOTE				null
	,RECIP_ADD_MSG					dbo.T_NOTE				null
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
	,LST_MAINT_DT 			dbo.T_DT 					null
	,LST_MAINT_USR_ID 	dbo.T_NAM 					null
	,constraint FK_RECIP_MSG_QUE foreign key(RECIP_PHONE)
	references dbo.RECIP (RECIP_PHONE)
)
end
go


