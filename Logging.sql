USE [LOGGING]
GO
/****** Object:  Table [dbo].[Batch_ErrorLog]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](8000) NOT NULL,
	[ErrorNumber] [varchar](20) NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Severity] [smallint] NULL,
	[ProcessID] [varchar](20) NULL,
	[ProcessName] [varchar](100) NULL,
	[KeyName] [varchar](20) NULL,
	[KeyValue] [varchar](50) NULL,
	[MachineName] [varchar](50) NULL,
	[UserID] [varchar](50) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch_Log]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_Log](
	[BatchID] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchTypeID] [int] NOT NULL,
	[ProcessStartDt] [datetime] NOT NULL,
	[ProcessEndDt] [datetime] NULL,
	[BatchStatus] [int] NOT NULL,
	[BatchStatusDt] [datetime] NOT NULL,
	[RecordCount] [int] NULL,
	[ExceptionCount] [int] NULL,
	[ErrorCode] [varchar](30) NULL,
	[ApplicationProcessID] [varchar](50) NULL,
	[CreateId] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[UpdateId] [varchar](100) NULL,
	[UpdateDt] [datetime] NULL,
 CONSTRAINT [PK_Batch_Log] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch_Notes]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_Notes](
	[BatchNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchID] [bigint] NOT NULL,
	[NoteID] [int] NULL,
	[Notes] [varchar](1000) NOT NULL,
	[CreateId] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[UpdateID] [varchar](100) NULL,
	[UpdateDt] [datetime] NULL,
 CONSTRAINT [pk_Process_Notes] PRIMARY KEY CLUSTERED 
(
	[BatchNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch_Status]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch_Status](
	[BatchStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchID] [bigint] NOT NULL,
	[BatchTypeID] [int] NULL,
	[BatchStatus] [int] NULL,
	[BatchStatusDt] [datetime] NOT NULL,
	[RecordCount] [int] NULL,
	[ExceptionCount] [int] NULL,
	[CreateID] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
 CONSTRAINT [PK_BatchProcess_Status] PRIMARY KEY CLUSTERED 
(
	[BatchStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchNotes_Ref]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchNotes_Ref](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[NoteType] [varchar](50) NOT NULL,
	[NoteDescription] [varchar](100) NOT NULL,
	[CreateID] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
 CONSTRAINT [PK_BatchNotes_Ref] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_BatchNotes_Ref] UNIQUE NONCLUSTERED 
(
	[NoteType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchStatus_Ref]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchStatus_Ref](
	[BatchStatus] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Comments] [varchar](500) NULL,
	[CreateID] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[UpdateID] [varchar](100) NULL,
	[UpdateDt] [datetime] NOT NULL,
 CONSTRAINT [pk_BatchStatus_Decode] PRIMARY KEY CLUSTERED 
(
	[BatchStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchType_BatchStatus_Map]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchType_BatchStatus_Map](
	[BatchTypeID] [int] NOT NULL,
	[BatchStatus] [int] NOT NULL,
	[CreateID] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
 CONSTRAINT [pk_batch_status_map] PRIMARY KEY CLUSTERED 
(
	[BatchTypeID] ASC,
	[BatchStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchType_Ref]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchType_Ref](
	[BatchTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BatchTypeName] [varchar](100) NOT NULL,
	[BatchDescription] [varchar](500) NULL,
	[CreateID] [varchar](100) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[UpdateID] [varchar](100) NULL,
	[UpdateDt] [datetime] NULL,
 CONSTRAINT [PK_BatchType_Ref] PRIMARY KEY CLUSTERED 
(
	[BatchTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_BatchTypeName] UNIQUE NONCLUSTERED 
(
	[BatchTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch_Log] ADD  DEFAULT (suser_sname()) FOR [CreateId]
GO
ALTER TABLE [dbo].[Batch_Log] ADD  DEFAULT (suser_sname()) FOR [UpdateId]
GO
ALTER TABLE [dbo].[Batch_Notes] ADD  DEFAULT (suser_sname()) FOR [CreateId]
GO
ALTER TABLE [dbo].[Batch_Notes] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[Batch_Notes] ADD  DEFAULT (suser_sname()) FOR [UpdateID]
GO
ALTER TABLE [dbo].[Batch_Notes] ADD  DEFAULT (getdate()) FOR [UpdateDt]
GO
ALTER TABLE [dbo].[Batch_Status] ADD  DEFAULT (suser_sname()) FOR [CreateID]
GO
ALTER TABLE [dbo].[Batch_Status] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[BatchNotes_Ref] ADD  DEFAULT (suser_sname()) FOR [CreateID]
GO
ALTER TABLE [dbo].[BatchNotes_Ref] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[BatchStatus_Ref] ADD  DEFAULT (suser_sname()) FOR [CreateID]
GO
ALTER TABLE [dbo].[BatchStatus_Ref] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[BatchStatus_Ref] ADD  DEFAULT (suser_sname()) FOR [UpdateID]
GO
ALTER TABLE [dbo].[BatchStatus_Ref] ADD  DEFAULT (getdate()) FOR [UpdateDt]
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map] ADD  DEFAULT (suser_sname()) FOR [CreateID]
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[BatchType_Ref] ADD  DEFAULT (suser_sname()) FOR [CreateID]
GO
ALTER TABLE [dbo].[BatchType_Ref] ADD  DEFAULT (getdate()) FOR [CreateDt]
GO
ALTER TABLE [dbo].[BatchType_Ref] ADD  DEFAULT (suser_sname()) FOR [UpdateID]
GO
ALTER TABLE [dbo].[BatchType_Ref] ADD  DEFAULT (getdate()) FOR [UpdateDt]
GO
ALTER TABLE [dbo].[Batch_Log]  WITH CHECK ADD  CONSTRAINT [FK_BatchStatus_Ref_Batch_log] FOREIGN KEY([BatchStatus])
REFERENCES [dbo].[BatchStatus_Ref] ([BatchStatus])
GO
ALTER TABLE [dbo].[Batch_Log] CHECK CONSTRAINT [FK_BatchStatus_Ref_Batch_log]
GO
ALTER TABLE [dbo].[Batch_Log]  WITH CHECK ADD  CONSTRAINT [FK_BatchType_ref_Batch_Log] FOREIGN KEY([BatchTypeID])
REFERENCES [dbo].[BatchType_Ref] ([BatchTypeID])
GO
ALTER TABLE [dbo].[Batch_Log] CHECK CONSTRAINT [FK_BatchType_ref_Batch_Log]
GO
ALTER TABLE [dbo].[Batch_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Log_Notes] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch_Log] ([BatchID])
GO
ALTER TABLE [dbo].[Batch_Notes] CHECK CONSTRAINT [FK_Batch_Log_Notes]
GO
ALTER TABLE [dbo].[Batch_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Batch_NoteType_Ref_Batch_Notes] FOREIGN KEY([NoteID])
REFERENCES [dbo].[BatchNotes_Ref] ([NoteID])
GO
ALTER TABLE [dbo].[Batch_Notes] CHECK CONSTRAINT [FK_Batch_NoteType_Ref_Batch_Notes]
GO
ALTER TABLE [dbo].[Batch_Status]  WITH CHECK ADD  CONSTRAINT [FK_Batch_BatchStatus_Map_BatchRun_Status] FOREIGN KEY([BatchTypeID], [BatchStatus])
REFERENCES [dbo].[BatchType_BatchStatus_Map] ([BatchTypeID], [BatchStatus])
GO
ALTER TABLE [dbo].[Batch_Status] CHECK CONSTRAINT [FK_Batch_BatchStatus_Map_BatchRun_Status]
GO
ALTER TABLE [dbo].[Batch_Status]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Log_Batch_Status] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch_Log] ([BatchID])
GO
ALTER TABLE [dbo].[Batch_Status] CHECK CONSTRAINT [FK_Batch_Log_Batch_Status]
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Ref_Batch_BatchStatus_Map] FOREIGN KEY([BatchTypeID])
REFERENCES [dbo].[BatchType_Ref] ([BatchTypeID])
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map] CHECK CONSTRAINT [FK_Batch_Ref_Batch_BatchStatus_Map]
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map]  WITH CHECK ADD  CONSTRAINT [FK_BatchStatus_ref_BatchStatus_Map] FOREIGN KEY([BatchStatus])
REFERENCES [dbo].[BatchStatus_Ref] ([BatchStatus])
GO
ALTER TABLE [dbo].[BatchType_BatchStatus_Map] CHECK CONSTRAINT [FK_BatchStatus_ref_BatchStatus_Map]
GO
/****** Object:  StoredProcedure [dbo].[getEMRConsultSummary]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getEMRConsultSummary] (@IntakeId BigInt)
	
AS
BEGIN
	

	SELECT 
		[IntakeID]
		,[OrderNumber] VisitNumber
		,Getdate() RequestDateTime
		,[PatientMRN] MedicalRecordNumber
		,[PatientLastName] LastName
		,[PhysicianFirstName] FirstName
		,[PatientDOB] DateOfBirth
		,[PatientGender] Gender
		,[ServiceLine] Specialty
		,[ReferringPhysicianName] ReferringPhysician
		,[PatientLocationAtTriage] PatientLocation
		,[ProviderSignature] Transriptionist
		,[ConsultStartDate] ConsultStartDateTime
		,[ConsultEndDate] ConsultEndDateTime
		--Neuro
		,[DiagnosisNeuro]
		,[IsTPAAdministered] Is_tPAConsult
		,[IsTPAAdministered] Was_tPARecommended  
		,[IsTPAAdministered] Was_tPARefused
		,Null as tPANotRecommendedReason 
		,Convert(varchar(30),Format([tpaDecisionDateTime],'MM/dd/yyyy hh:mm tt', 'en-US'))	 tPADecisionDatetime 
		,Convert(varchar(30),Format([tpaAdminDateTime],'MM/dd/yyyy hh:mm tt', 'en-US'))	  tPAAdmissionDatetime 
		,[AdmissionRecommendation] AdmissionRecommendation
		,'0' as NIHStrokeScore
		,Convert(varchar(30),Format(Coalesce([PhysicianLKWDateTime],[FacilityLKWDateTime]),'MM/dd/yyyy hh:mm tt', 'en-US'))	  TimeLastKnownWell 
		,[RadiologicStudies] RadiologicStudyNotes
		--Psychiatry 

		,[ReasonforConsult] IntakeConsultReason 
		,Coalesce([TriageDiagnosis],[HospitalWorkingDiagnosis]) PhysicianConsultReason 
		,[SimpleComplex] PsychType
		,[DSMVDiagnosis] DSMVDiagnosis 
		,Null as AdmissionOrTransferRecommendations 
		,[TreatmentRecommendations] TreatmentRecommendationAndMedications
		--CriticalCare
		,Convert(varchar(30),Format(ConsultStartDate,'MM/dd/yyyy hh:mm tt', 'en-US'))	   CallDateTime
  FROM [LOGGING].[Avizia].[PDFConsultSummary] s
  join PRELOADREPL.[dbo].[TimeZones] tz
  on tz.TimeZoneCode=s.TimeZoneCode
  Left join ( Select [SOC_ID],[SPECIALTY],[SEND_FROM],[SEND_BY],[SENT_FROM_FAX],[CALL_BACK_NUMBER] 
			From PRELOADREPL.[dbo].[FACILITY_DOCUMENTATION_SYSTEM] FD 
			Join PRELOADREPL.[dbo].[FACILITY] F 
			on F.[FACILITY_ID]=FD.FACILITY_ID) D
  on s.[FacilityCode]=D.[SOC_ID]
  and left([SPECIALTY],5)=left([ServiceLine],5)
  outer apply preloadrepl.[dbo].[ConvertBetweenTimeZones] (   [ConsultEndDate]  ,1  ,tz.TimeZoneID) a4 
  outer apply preloadrepl.[dbo].[ConvertBetweenTimeZones] (   Getdate()  ,1  ,tz.TimeZoneID) a3
  Where  ConsultSummaryID=(select max(ConsultSummaryID) from [LOGGING].[Avizia].[PDFConsultSummary] where Intakeid=@IntakeId)





END
GO
/****** Object:  StoredProcedure [dbo].[SP_BatchLib_AddBatchLog]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
-- Author:		Satish Divichenchu
-- Create date: 11/16/2015
-- Description:	Part of Batch Log framework. Records the run of any given batch to the Batch Log table
--				This will automatically add a batch status record if a batchstatus is passed to the Store Proc
--	Revisions
--	Owner		Date			WI			Description
	PSBHAT		3/20/2013		5455		Fixed the bug where it was still referring to BatchID as BatchRunID.
-- =============================================*/
CREATE PROCEDURE [dbo].[SP_BatchLib_AddBatchLog] 
	-- Add the parameters for the stored procedure here
	@pBatchTypeID	int , 
	@pRecordCount	int = 0, 
	@pProcessStartDt datetime = null, 
	@pProcessEndDt	datetime = null, 
	@pBatchStatus	int = 10, 
	@pExceptionCount	int	= 0, 
	@pErrorCode		varchar(30) = null, 
	@pApplicationProcessID varchar(50) = null, 
	--@pParentBatchID	bigint = null, 
	@pCreateDt		datetime = null, 
	@pCreateId		varchar(15) = null, 
	@pBatchID BigInt Output
AS
BEGIN
BEGIN TRY

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @createdt datetime
	declare @userid varchar(15)
	declare @batchid BigInt

	Select @createdt = Isnull(@pCreateDt,getdate()), @userid = Isnull(@pCreateId, suser_sname())
	if (@pBatchStatus is null)
	begin
		set @pBatchStatus = 10 -- default the value to 
	end

	-- insert into batchrun_log 
	Insert into dbo.Batch_Log(
				BatchTypeID, RecordCount, ProcessStartDt, ProcessEndDt, BatchStatus, BatchStatusDt,  ExceptionCount, ErrorCode, 
				ApplicationProcessID,  CreateDt, CreateId, UpdateId, UpdateDt)
	Select		@pBatchTypeID, Isnull(@pRecordCount,0), Isnull(@pProcessStartDt, @createdt) , @pProcessEndDt	, @pBatchStatus, 
				@createdt, @pExceptionCount	, @pErrorCode, @pApplicationProcessID , 
				 @createdt, @userid, @userid, @createdt
	
	Select @pBatchID = SCOPE_IDENTITY()

	IF (@pBatchStatus > 0)
	Begin
		-- If we already have a batch status then we will call the STP to update batch status record from here
		-- Here we need to ask the BatchRun Status SP to not update the BatchRun_lOg table
		declare @batchrunstatusid bigint

		Exec dbo.SP_BatchLib_AddBatchStatus @pBatchID, @pBatchStatus,@createdt, @userid,'N',@pRecordCount, @pExceptionCount,  @batchrunstatusid out
	End

	Select 'BATCHID' = @pBatchID

END TRY
BEGIN CATCH 
	Declare @message varchar(1000)
	SELECT @message = 'Error#:'+ convert(varchar(10),ERROR_NUMBER()) + ' ErrorLine#'+ convert(varchar(10),Error_line())
					+ ' Message:'+ERROR_MESSAGE()
	RaisError(@message, 16,1)
END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[SP_BatchLib_AddBatchStatus]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =====================================================================================
-- Author:		Satish Divichenchu
-- Create date: 11/14/2015
-- Description:	Used for inserting a batchstatus. This will auto update the batchrun_log
--	Revisions
--	Owner		Date			WI			Description
-- =====================================================================================*/
CREATE PROCEDURE [dbo].[SP_BatchLib_AddBatchStatus] 
	-- Add the parameters for the stored procedure here
	@pBatchID	bigint,
	@pBatchStatus int,
	@pStatusDt datetime = null,
	@pUserId	varchar(15) = null,
	@pUpdateBatchLog char(1) = 'Y',
	@pRecordCount Int=0,
	@pExceptionCount Int=0,
	@pBatchStatusID bigint Output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @today datetime
		SET @today = getdate()

		-- Insert statements for procedure here
		Insert into [dbo].[Batch_Status]
			(BatchID, BatchTypeID, BatchStatus, BatchStatusDt, CreateDt, CreateID,RecordCount,[ExceptionCount])
		SELECT	@pBatchID, BatchTypeId, @pBatchStatus, IsNull(@pStatusDt, @today), 
				@today, Isnull(@pUserid, suser_sname()),isnull(@pRecordCount,0),isnull(@pExceptionCount,0)
		from	Batch_Log
		where	BatchID = @pBatchID

		SELECT @pBatchStatusID = Scope_identity()
		
			-- Update the Batchrun_log with the status but only if the latest status changes
		UPDATE	[dbo].[Batch_Log]
		SET		[BatchStatus] = @pBatchStatus,
				[BatchStatusDt] = IsNull(@pStatusDt, @today),
					[UpdateId] = Isnull(@pUserid, suser_sname()),
					[UpdateDt] = @today
		WHERE
				[BatchID] = @pBatchID and
				[BatchStatus] <> @pBatchStatus and
				IsNull(@pUpdateBatchLog,'Y') <> 'N'

	END TRY
	BEGIN CATCH
		Declare @message varchar(1000)
		SELECT @message = 'Error#:'+ convert(varchar(10),ERROR_NUMBER()) + ' ErrorLine#'+ convert(varchar(10),Error_line())
						+ ' Message:'+ERROR_MESSAGE()
		RaisError(@message, 16,1)
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[SP_BatchLib_AddNote]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =====================================================================================
-- Author:		Satish Divichenchu
-- Create date: 11/15/2015
-- Description:	Used for inserting a note. 
--				
-- =====================================================================================
CREATE PROCEDURE [dbo].[SP_BatchLib_AddNote] 
	-- Add the parameters for the stored procedure here
	@pBatchID bigint,
	@pNoteID int,
	@pNote varchar(1000),
	@pCreateId varchar(15),
	@pBatchNoteId bigint output
	
AS
BEGIN
	BEGIN TRY
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		If Rtrim(IsNull(@pNote,'')) = ''
		Begin
			Raiserror('Note is a required field and cannot be null or blank', 16,1)
			return
		End


		declare @today datetime
		SET @today = getdate()
		-- Insert statements for procedure here
		Insert into [dbo].[Batch_Notes] 
			(BatchID, NoteID, Notes, CreateId, CreateDt)
		SELECT @pBatchID , @pNoteID, @pNote, ISNULL(@pCreateId, suser_sname()), @today

		Select @pBatchNoteId = SCOPE_IDENTITY()

	END TRY
	BEGIN CATCH
		Declare @message varchar(1000)
		SELECT @message = 'Error#:'+ convert(varchar(10),ERROR_NUMBER()) + ' ErrorLine#'+ convert(varchar(10),Error_line())
						+ ' Message:'+ERROR_MESSAGE()
		RaisError(@message, 16,1)
	END CATCH

END



GO
/****** Object:  StoredProcedure [dbo].[SP_BatchLib_GetOpenBatch]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* =============================================
-- Author:		Satish Divichenchu
-- Create date: 11/15/2015
-- Description:	Returns MasterBatchID and ParentBatchID for given MasterBatchTypeID ,Current BatchTypeID and Current MasterBatchStatus
-- =============================================*/

CREATE PROCEDURE [dbo].[SP_BatchLib_GetOpenBatch] 
	@BatchTypeID Int,
	@BatchStatus Int
	
AS
BEGIN


SELECT top 1 batchid  as ParentBatchID 
FROM [Logging].[dbo].[Batch_Log] s  WITH (NOLOCK)
Where batchtypeid=@BatchTypeID 
Order by  s.batchid 

END



GO
/****** Object:  StoredProcedure [dbo].[SP_BatchLib_UpdateBatchLog]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* =============================================
-- Author:		Prashant Bhat
-- Create date: 11/14/2012
-- Description:	Part of Batch Log framework. Allows caller to update the updatetable fields
--				Updates the Run Log. To update status , please use the Status SP
--	Note		: If you dont want a particular field to be updated, pass Null and the update will
--					ensure that the nullfied parameter will not overwrite the existing data.
--				RecordCount, ExceptionCount and ErrorCode are required params
--				@pSuccessfulComplete works this way
--					NULL- if ProcessEndDt is populated and ErrorCode is null/blank, set @pSuccessfulComplete to 'Y', else to 'N'
--					N	- do not change BatchStatus, do not update parent process
--					Y	- do following:
--							set BatchStatus to 1000
--							update parent Workflow to the status set up in the Workflow config table
--							if onSuccessSQLHandler is not null, execute it with parameters @DependentBatchID, @WorkflowBatchID
-- =============================================
*/

CREATE PROCEDURE [dbo].[SP_BatchLib_UpdateBatchLog] 
	-- Add the parameters for the stored procedure here
	@pBatchID	BigInt, 
	@pRecordCount	int, 
	@pProcessEndDt	datetime = null, 
	@pExceptionCount	int, 
	@pErrorCode		varchar(30), 
	@pApplicationProcessID varchar(50) = null, 
	@pSuccessfulComplete char(1) = null,
	@pUpdateDt		datetime = null,
	@pUpdateId		varchar(15) = null
AS
BEGIN
BEGIN TRY
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;
		declare @today datetime
		declare @userid varchar(15)

		select @today = getdate()
		--Select @today = Isnull(@pUpdateDt,getdate()), @userid = Isnull(@pUpdateId, suser_sname())
	
		set @pSuccessfulComplete = isnull( @pSuccessfulComplete, 
				case 
					when @pProcessEndDt is not null and isnull( @pErrorCode,'') = '' 
					then 'Y' 
					else 'N' 
				end)
			
		-- insert into batchrun_log 
		UPDATE BRL
		SET RecordCount = Isnull(@pRecordCount, BRL.RecordCount),
			ProcessEndDt = Isnull(@pProcessEndDt, BRL.ProcessEndDt),
			ExceptionCount = Isnull(@pExceptionCount, BRL.ExceptionCount) ,
			ErrorCode		= IsNull(@pErrorCode, BRL.ErrorCode),
			ApplicationProcessID = Isnull(@pApplicationProcessID, BRL.ApplicationProcessID),
			UpdateDt	= isnull( @pUpdateDt, @today),
			UpdateId	= isnull( @pUpdateID, suser_sname())
		FROM Logging.dbo.Batch_Log BRL 
		WHERE [BatchID] = @pBatchID

		if @pSuccessfulComplete = 'Y'
		begin

			declare @BatchStatus int, @BatchStatusID bigint, @parentBatchID bigint
			declare @SQL nvarchar( 4000), @ParamDef nvarchar(4000)

			-- set THIS batch to Completed
			set @BatchStatus = 1000

			execute [SP_BatchLib_AddBatchStatus]
				@pBatchID = @pBatchID,
				@pBatchStatus = @BatchStatus,
				@pBatchStatusID = @BatchStatusID,
				@pRecordCount	=@pRecordCount,
				@pExceptionCount=	@pExceptionCount

		end

	END TRY
	BEGIN CATCH
		Declare @message varchar(1000)
		SELECT @message = 'Error#:'+ convert(varchar(10),ERROR_NUMBER()) + ' ErrorLine#'+ convert(varchar(10),Error_line())
						+ ' Message:'+ERROR_MESSAGE()
		RaisError(@message, 16,1)
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_EntLib_LogError]    Script Date: 3/30/2022 12:38:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Prashant Bhat
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_EntLib_LogError] (
	 @pMessage Varchar(8000) ,
	 @pErrorNumber Varchar(20) ,
	 @pTimeStamp Datetime ,
	 @pSeverity Smallint = 4, -- INFO
	 @pProcessID Varchar(20) = null,
	 @pProcessName Varchar(100) = null,
	 @pKeyName Varchar(20) = null,
	 @pKeyValue Varchar(50) = null,
	 @pMachineName Varchar(50) = null,
	 @pUserID Varchar(50) = null,
	 @pLogID Bigint Output
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
    INSERT INTO Batch_ErrorLog ([Message], [ErrorNumber], [TimeStamp], Severity, ProcessID, ProcessName, 
							KeyName, KeyValue, MachineName,UserID)
	Select				@pMessage , @pErrorNumber , @pTimeStamp , @pSeverity , @pProcessID , @pProcessName ,
						@pKeyName, @pKeyValue , @pMachineName , isnull(@pUserID , suser_sname())
	
	SELECT @pLogID = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage nvarchar(4000),  @ErrorSeverity int;
	  SELECT @ErrorMessage = 'Database Error during ErrorLog Insert: '+ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
	  RAISERROR(@ErrorMessage, @ErrorSeverity, 1)
	END CATCH

END

/****** Object:  UserDefinedFunction [dbo].[ufn_BatchLib_GetNoteID]    Script Date: 9/22/2015 12:01:55 PM ******/
SET ANSI_NULLS ON

GO
