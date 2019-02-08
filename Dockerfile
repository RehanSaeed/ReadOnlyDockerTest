 FROM microsoft/dotnet:2.2-sdk AS builder
 WORKDIR /source
 COPY *.csproj .
 RUN dotnet restore
 COPY . .
 RUN dotnet publish --output /app/ --configuration Release

 # Stage 2
 FROM microsoft/dotnet:2.2-aspnetcore-runtime
 ENV COMPlus_EnableDiagnostic=0
 WORKDIR /app
 COPY --from=builder /app .
 ENTRYPOINT ["dotnet", "ReadOnlyTest.dll"]