DDD and Clean Architecture folder structure for a .NET User Management System

mkdir UserManagement
cd UserManagement
dotnet new sln -n UserManagement

dotnet new webapi -n UserManagement.Api
dotnet new classlib -n UserManagement.Application
dotnet new classlib -n UserManagement.Domain
dotnet new classlib -n UserManagement.Infrastructure

dotnet new xunit -n UserManagement.UnitTests
dotnet new xunit -n UserManagement.IntegrationTests

dotnet sln add UserManagement.Api
dotnet sln add UserManagement.Application
dotnet sln add UserManagement.Domain
dotnet sln add UserManagement.Infrastructure
dotnet sln add UserManagement.UnitTests
dotnet sln add UserManagement.IntegrationTests

# The API should be the one to link them all together

dotnet add UserManagement.Api reference UserManagement.Application
dotnet add UserManagement.Api reference UserManagement.Infrastructure
dotnet add UserManagement.Application reference UserManagement.Domain
dotnet add UserManagement.Infrastructure reference UserManagement.Domain

# Add test project references

dotnet add UserManagement.UnitTests reference UserManagement.Domain
dotnet add UserManagement.UnitTests reference UserManagement.Application
dotnet add UserManagement.IntegrationTests reference UserManagement.Api

mkdir UserManagement.Domain/Aggregates
mkdir UserManagement.Domain/Entities  
mkdir UserManagement.Domain/ValueObjects
mkdir UserManagement.Domain/DomainEvents
mkdir UserManagement.Domain/DomainServices
mkdir UserManagement.Domain/Specifications
mkdir UserManagement.Domain/Repositories
mkdir UserManagement.Domain/Exceptions

mkdir UserManagement.Application/Commands
mkdir UserManagement.Application/Queries  
mkdir UserManagement.Application/Handlers
mkdir UserManagement.Application/DTOs
mkdir UserManagement.Application/Interfaces
mkdir UserManagement.Application/Behaviors
mkdir UserManagement.Application/EventHandlers
mkdir UserManagement.Application/Validators

mkdir UserManagement.Infrastructure/Data
mkdir UserManagement.Infrastructure/Repositories
mkdir UserManagement.Infrastructure/ExternalServices
mkdir UserManagement.Infrastructure/Migrations
mkdir UserManagement.Infrastructure/Configuration

mkdir UserManagement.Api/Controllers
mkdir UserManagement.Api/Middleware
mkdir UserManagement.Api/Configuration
mkdir UserManagement.Api/Filters

# Optional Domain additions

mkdir UserManagement.Domain/Common # Base classes, shared value objects
mkdir UserManagement.Domain/Events # If you want to separate domain events further

# Optional Application additions

mkdir UserManagement.Application/Common
mkdir UserManagement.Application/Common/Models # Shared DTOs/Response models
mkdir UserManagement.Application/Common/Exceptions # Application-specific exceptions
