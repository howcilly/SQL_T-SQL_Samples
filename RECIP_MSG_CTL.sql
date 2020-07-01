--========================================================================
-- Module: RECIP_MSG_CTL.sql
--
-- Purpose: This is a script made to 
--				drop and create the RECIP_MSG_CTL table
--				This table is used to control the preset message stop code
--				This table can never be editable by a user
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

if not exists (select 1 from information_schema.tables where table_name = 'RECIP_MSG_CTL')
begin
  create table dbo.RECIP_MSG_CTL (
	STOP_MSG_COD 		dbo.T_NAM		not null
	,STOP_MSG 				dbo.T_NOTE		not null
	,constraint PK_RECIP_MSG_CONTROL primary key (STOP_MSG_COD)
)
end
go


