--========================================================================
-- Module: SMS_CONNECT_GRP.sql
--
-- Purpose: This is a script made to 
--				drop and create the SMS_CONNECT_GRP table
--				This table is used to control the group codes for SMS connect
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

if not exists (select 1 from information_schema.tables where table_name = 'SMS_CONNECT_GRP')
begin
  create table dbo.SMS_CONNECT_GRP (
	GRP_COD 		dbo.T_NAM 		not null
	,GRP_CAT			dbo.T_COD		not null
	,GRP_MSG 		dbo.T_NOTE 	not null
	,constraint PK_SMS_CONNECT_GRP primary key (GRP_COD)
)
end
go

