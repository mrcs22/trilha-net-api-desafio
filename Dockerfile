FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
WORKDIR /source
COPY . .
RUN dotnet restore "./src/TrilhaApiDesafio.csproj" 

RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"

RUN dotnet publish "./src/TrilhaApiDesafio.csproj" -c release -o /app --no-restore

EXPOSE 5000

