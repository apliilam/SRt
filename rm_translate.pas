unit RM_Translate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


resourcestring
  TranslateFile_RU = 'languages\PR_Maker.ru.po';
  TranslateFile_EN = 'languages\PR_Maker.en.po';
  Trl_prGroupBoxFileCaption = 'File(s) list:';
  Trl_Create = 'Create';
  Trl_DonationMessage1 = 'If your working speed increased by this application, you can make a donation via Paypal';
  Trl_DonationMessage2 = 'Copy email to clipboard?';
  Trl_DonationMessage3 = 'Donate?';
  Trl_FileNotFound = 'File not found';
  Trl_Error = 'Oops!';
  Trl_GetFileDate = 'Get file Date';
  Trl_GetCurrentDate = 'Get current Date';
  Trl_YouNeedAddFileToList = 'You need to add file(s) to the list';
  Trl_Confirmation = 'Confirmation';
  Trl_Information = 'Information';
  Trl_ContinueQ = 'Continue?';
  Trl_YouMustFillAllFields = 'You must be fill all fields';
  Trl_PhotographerDateCanNotBeEarlierOwnerDate = '"Photographer Date" can not be earlier than "Owner Date"';
  Trl_PhotographerDateCanNotBeEarlierModelDate = '"Photographer Date" can not be earlier than "Model Date"';
  Trl_ModelDateCanNotBeEarlierShootDate = '"Model Date" can not be earlier than "Shoot Date"';
  Trl_ModelMustBeAnAdult = 'The Model must be an adult. Make sure the correct date of birth Models';
  Trl_WitnessDateCanNotBeEarlierPhotographerDate = '"Witness Date" can not be earlier than "Photographer Date"';
  Trl_SketchesHasNotBeenAdded = 'Images has not been added.';
  Trl_File_ = 'File ';
  Trl__AlreadyExistsDot = ' already exists.';
  Trl_OverwriteFileQ = 'Overwrite file?';
  Trl_CountFilesError_TooManyFiles = 'Too many files!';
  Trl_mustBeLessThan = 'allowable no more than ';
  Trl__files = ' files';
  Trl_ReleaseFileCreated = 'Release file created';
  Trl_UploadSignatureFile = 'Upload Signature file(s)';
  Trl_BeCarefulDigitalSignature = 'Be careful! Some microstock prohibit the use digitized signature.';
  Trl_FillNamefieldinENGform = 'Fill Name(print) field in the ENG form';
  Trl_ErrorCreatingTable = 'An error occurred while creating a table';
  Trl_TurnOnForm = 'Turn On form (ENG and/or RUS)';
  Trl_IamOwnerAndPhotographer = ' I am Owner and Photographer';
  Trl_IamModelAndPhotographer = ' I am Model and Photographer';
  Trl_YouNeedNameReleaseFile = 'You need to add Release file name';

implementation




end.

