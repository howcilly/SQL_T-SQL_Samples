--========================================================================
-- Module: RECIP.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP table
--				This table represents all our recipients populated from the AR_CUST table
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP')
begin
  create table dbo.RECIP(
	RECIP_PHONE 						dbo.T_PHONE		not null
	,CUST_NO 							dbo.T_CUST_NO	not null
	,RECIP_NAM 						dbo.T_NAM			not null
	--null due to the stop message addition trigger that is called on insertion/update of a new record
	,RECIP_MSG_TO_SEND 			dbo.T_NOTE			null
	--if msg date/time is null then the message has not been sent to the que
	,RECIP_MSG_SEND_DATE 		dbo.T_DT				null
	,RECIP_MSG_SEND_TIME 		dbo.T_DT				null
	,RECIP_TYP 							dbo.T_FLG2			null
	,RECIP_CITY 							dbo.T_CITY			null
	,RECIP_STATE 						dbo.T_STATE		null
	,RECIP_ZIP_COD 					dbo.T_ZIP_COD	null
	,RECIP_URL_DASH 				dbo.T_URL			null
	,RECIP_CATEG_COD 				dbo.T_COD			null
	,RECIP_MSG_GRP			dbo.T_NAM					null
	--if null then the user is not opted out and we can send messages to them
	,RECIP_OPTED_OUT 				dbo.T_FLG					null
	,RECIP_LST_MSG_SENT 		dbo.T_NOTE					null
	,RECIP_LST_MSG_SENT_DT 	dbo.T_DT						null
	,RECIP_LST_TKT_DT 				dbo.T_DT						null
	,RECIP_LST_ITEM_NO 			dbo.T_ITEM_NO			null
	,RECIP_LST_ITEM_CAT 			dbo.T_COD			null
	,RECIP_LST_ITEM_QTY			dbo.T_QTY					null
	,RECIP_LST_ITEM_LOC_ID 	dbo.T_COD					null
	,RECIP_LOY_PGM_COD 			dbo.T_COD					null
	,RECIP_HAS_LOY 					dbo.T_FLG					null
	,RECIP_LOY_CRD_NO			dbo.T_CR_CARD_NO	null
	,RECIP_LOY_BAL 					dbo.T_LOY_PTS				null
	--if null then the recipient has no inbox messages in the bandwidth get request of sms incoming
	--else then reference the RECIP_MSG_INBOX table
	,RECIP_HAS_INBOX 		dbo.T_FLG		null
	,LST_MAINT_DT 			dbo.T_DT 		null
	,LST_MAINT_USR_ID 	dbo.T_NAM 		null
	,constraint FK_RECIP_AR_CUST foreign key(CUST_NO)
	references dbo.AR_CUST (CUST_NO)
	,constraint PK_RECIP primary key (RECIP_PHONE)
)
end
go


