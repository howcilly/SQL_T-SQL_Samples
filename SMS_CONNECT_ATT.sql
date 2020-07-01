--========================================================================
-- Module: SMS_CONNECT_ATT.sql
--
-- Purpose: This is a script made to 
--				drop and create the SMS_CONNECT_ATT table
--				This table represents the message as a gridded item
--				This grid is used to change according to category selection in the outgoing connect campaigns
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
drop table SMS_CONNECT_ATT
if not exists (select 1 from information_schema.tables where table_name = 'SMS_CONNECT_ATT')
begin
  create table dbo.SMS_CONNECT_ATT(
	CONNECT_GRP 				dbo.T_NAM		not null
	,CONNECT_CAT 				dbo.T_NAM		null
	,CONNECT_MSG_COD		dbo.T_COD		null
	--null due to the stop message addition trigger that is called on insertion/update of a new record
	,CONNECT_MSG_CAT				dbo.T_COD		null
	--if msg date/time is null then the message has not been sent to the que
	,CONNECT_MSG_SEND_DATE	dbo.T_DT			null
	,CONNECT_MSG_SEND_TIME	dbo.T_DT			null
	,CONNECT_TYP 						dbo.T_FLG2		null
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
	,CONNECT_CATEG_COD 	dbo.T_COD					null
	--if null then the user is not opted out and we can send messages to them
	,CONNECT_GRP_ENABLED			dbo.T_FLG		null
	,CONNECT_LST_MSG_SENT 			dbo.T_NOTE		null
	,CONNECT_LST_MSG_SENT_DT 	dbo.T_DT			null
	,LST_MAINT_DT 							dbo.T_DT 		null
	,LST_MAINT_USR_ID 					dbo.T_NAM 		null
	,constraint PK_SMS_CONNECT_ATT primary key (CONNECT_GRP)
)
end
go


