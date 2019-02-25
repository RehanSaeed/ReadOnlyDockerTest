 FROM microsoft/dotnet:2.2-sdk AS builder
 WORKDIR /source
 COPY *.csproj .
 RUN dotnet restore
 COPY . .
 RUN dotnet publish --output /app/ --configuration Release

 FROM microsoft/dotnet:2.2-aspnetcore-runtime
 # Disable debuggging and profiling.
 ENV COMPlus_EnableDiagnostics=0 
 WORKDIR /app
 COPY --from=builder /app .
 ENTRYPOINT ["dotnet", "ReadOnlyTest.dll"]