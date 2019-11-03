#!/bin/bash

GITVERSION="$(dotnet /app/GitVersion.dll /github/workflow)"

ls /github
ls /github/home
ls /github/workspace
ls /github/workflow

echo $GITVERSION

function GetComponent {
	echo $GITVERSION | grep -oP "\""$1'":"?\K([^",]*)'
}

echo ::set-output name=GITVERSION_NuGetVersionV2::$(GetComponent NuGetVersionV2)
echo ::set-output name=GITVERSION_Major::$(GetComponent Major)
echo ::set-output name=GITVERSION_Minor::$(GetComponent Minor)
echo ::set-output name=GITVERSION_Patch::$(GetComponent Patch)
echo ::set-output name=GITVERSION_FullSemVer::$(GetComponent FullSemVer)
echo ::set-output name=GITVERSION_InformationalVersion::$(GetComponent InformationalVersion)
echo ::set-output name=GITVERSION_PreReleaseTag::$(GetComponent PreReleaseTag)
echo ::set-output name=GITVERSION_PreReleaseLabel::$(GetComponent PreReleaseLabel)
echo ::set-output name=GITVERSION_BuildMetaData::$(GetComponent BuildMetaData)