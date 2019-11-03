#!/bin/bash

GITVERSION="$(dotnet /app/GitVersion.dll ./)"

echo $GITVERSION

function GetComponent {
	echo $GITVERSION | grep -oP "\""$1'":"?\K([^",]*)'
}

echo ::set-output name=version::$(GetComponent NuGetVersionV2)

echo ::set-env name=GITVERSION_NuGetVersionV2::$(GetComponent NuGetVersionV2)
echo ::set-env name=GITVERSION_Major::$(GetComponent Major)
echo ::set-env name=GITVERSION_Minor::$(GetComponent Minor)
echo ::set-env name=GITVERSION_Patch::$(GetComponent Patch)
echo ::set-env name=GITVERSION_FullSemVer::$(GetComponent FullSemVer)
echo ::set-env name=GITVERSION_InformationalVersion::$(GetComponent InformationalVersion)
echo ::set-env name=GITVERSION_PreReleaseTag::$(GetComponent PreReleaseTag)
echo ::set-env name=GITVERSION_PreReleaseLabel::$(GetComponent PreReleaseLabel)
echo ::set-env name=GITVERSION_BuildMetaData::$(GetComponent BuildMetaData)