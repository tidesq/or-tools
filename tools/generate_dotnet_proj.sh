#!/usr/bin/env bash
# usage: ./tools/generate_dotnet_csproj.sh

set -e

# Gets OR_TOOLS_MAJOR and OR_TOOLS_MINOR
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${DIR}" ]]; then
  DIR="${PWD}";
fi
# shellcheck disable=SC1090
. "${DIR}/../Version.txt"

###############
##  Cleanup  ##
###############
echo "Remove previous .[cf]sproj .sln files..."
rm -f examples/*/*.csproj
rm -f examples/*/*.fsproj
rm -f examples/*/*.sln
rm -f ortools/*/samples/*.csproj
rm -f ortools/*/samples/*.fsproj
rm -f ortools/*/samples/*.sln
echo "Remove previous .[cf]sproj files...DONE"

##############
##  CSHARP  ##
##############
for FILE in examples/*/*.cs; do
  # if no files found do nothing
  [ -e "$FILE" ] || continue
  PROJ="${FILE%.cs}.csproj";
  echo "Generate $PROJ..."
  BASE=$(basename "$FILE")
  cat >"$PROJ" <<EOL
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <LangVersion>7.2</LangVersion>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <EnableDefaultItems>false</EnableDefaultItems>
    <RestoreSources>../../packages;\$(RestoreSources);https://api.nuget.org/v3/index.json</RestoreSources>
  </PropertyGroup>

  <PropertyGroup Condition=" '\$(Configuration)|\$(Platform)' == 'Debug|AnyCPU' ">
    <DebugType>full</DebugType>
    <Optimize>true</Optimize>
    <GenerateTailCalls>true</GenerateTailCalls>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="$BASE" />
    <PackageReference Include="Google.OrTools" Version="${OR_TOOLS_MAJOR}.${OR_TOOLS_MINOR}.*" />
  </ItemGroup>
</Project>
EOL
  echo "Generate $PROJ...DONE"
done

##############
##  FSHARP  ##
##############
for FILE in examples/*/*.fs; do
  # if no files found do nothing
  [ -e "$FILE" ] || continue
  PROJ="${FILE%.fs}.fsproj";
  echo "Generate $PROJ..."
  BASE=$(basename "$FILE")
  cat >"$PROJ" <<EOL
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <EnableDefaultItems>false</EnableDefaultItems>
    <RestoreSources>../../packages;\$(RestoreSources);https://api.nuget.org/v3/index.json</RestoreSources>
  </PropertyGroup>

  <PropertyGroup Condition=" '\$(Configuration)|\$(Platform)' == 'Debug|AnyCPU' ">
    <DebugType>full</DebugType>
    <Optimize>true</Optimize>
    <GenerateTailCalls>true</GenerateTailCalls>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="$BASE" />
    <PackageReference Include="Google.OrTools.FSharp" Version="${OR_TOOLS_MAJOR}.${OR_TOOLS_MINOR}.*" />
  </ItemGroup>
</Project>
EOL
  echo "Generate $PROJ...DONE"
done

##################
##  Samples C#  ##
##################
for FILE in ortools/*/samples/*.cs; do
  # if no files found do nothing
  [ -e "$FILE" ] || continue
  PROJ="${FILE%.cs}.csproj";
  echo "Generate $PROJ..."
  BASE=$(basename "$FILE")
  cat >"$PROJ" <<EOL
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <LangVersion>7.2</LangVersion>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <EnableDefaultItems>false</EnableDefaultItems>
    <RestoreSources>../../../packages;\$(RestoreSources);https://api.nuget.org/v3/index.json</RestoreSources>
  </PropertyGroup>

  <PropertyGroup Condition=" '\$(Configuration)|\$(Platform)' == 'Debug|AnyCPU' ">
    <DebugType>full</DebugType>
    <Optimize>true</Optimize>
    <GenerateTailCalls>true</GenerateTailCalls>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="$BASE" />
    <PackageReference Include="Google.OrTools" Version="${OR_TOOLS_MAJOR}.${OR_TOOLS_MINOR}.*" />
  </ItemGroup>
</Project>
EOL
  echo "Generate $PROJ...DONE"
done

#################
##  Samples F# ##
#################
for FILE in ortools/*/samples/*.fs; do
  # if no files found do nothing
  [ -e "$FILE" ] || continue
  PROJ="${FILE%.fs}.fsproj";
  echo "Generate $PROJ..."
  BASE=$(basename "$FILE")
  cat >"$PROJ" <<EOL
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <EnableDefaultItems>false</EnableDefaultItems>
    <RestoreSources>../../../packages;\$(RestoreSources);https://api.nuget.org/v3/index.json</RestoreSources>
  </PropertyGroup>

  <PropertyGroup Condition=" '\$(Configuration)|\$(Platform)' == 'Debug|AnyCPU' ">
    <DebugType>full</DebugType>
    <Optimize>true</Optimize>
    <GenerateTailCalls>true</GenerateTailCalls>
  </PropertyGroup>

  <ItemGroup>
    <Compile Include="$BASE" />
    <PackageReference Include="Google.OrTools.FSharp" Version="${OR_TOOLS_MAJOR}.${OR_TOOLS_MINOR}.*" />
  </ItemGroup>
</Project>
EOL
  echo "Generate $PROJ...DONE"
done

###########
##  SLN  ##
###########
SLN=Google.OrTools.Examples.sln
echo "Generate ${SLN}..."
pushd examples/dotnet
dotnet new sln -n ${SLN%.sln}
for i in *.*proj; do
  dotnet sln ${SLN} add "$i"
done
echo "Generate ${SLN}...DONE"
popd

SLN=Google.OrTools.Contrib.sln
echo "Generate ${SLN}..."
pushd examples/contrib
dotnet new sln -n ${SLN%.sln}
for i in *.*proj; do
  dotnet sln ${SLN} add "$i"
done
echo "Generate ${SLN}...DONE"
popd

# vim: set tw=0 ts=2 sw=2 expandtab:
