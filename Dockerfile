# Build Stage
FROM microsoft/aspnetcore-build:2 as build-env
WORKDIR /notesapi

# restore using solution file
#COPY Api/Api.csproj ./Api/ 
COPY /api.csproj ./api/ 
RUN dotnet restore /api.csproj
#COPY UnitTests/UnitTests.csproj ./UnitTests/
#RUN dotnet restore UnitTests/UnitTests.csproj

# get the output of the files copied in: 
#RUN ls -alR

# copy src
COPY . .

# test
#RUN dotnet test UnitTests/UnitTests.csproj --test-adapter-path:. --logger:xunit

# publish
RUN dotnet publish /api.csproj -o /publish

# runtime stage
FROM microsoft/aspnetcore:2 as runtime-image
COPY --from=build-env /publish /publish
WORKDIR  /publish
ENTRYPOINT [ "dotnet", "Api.dll" ]