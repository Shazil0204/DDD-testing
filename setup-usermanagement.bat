@echo off
echo 🚀 Starting UserManagement Clean Architecture Setup...

REM Create main directory and navigate to it
echo 📁 Creating UserManagement directory...
if not exist "UserManagement" mkdir UserManagement
cd UserManagement

REM Create solution
echo 📋 Creating solution file...
dotnet new sln -n UserManagement

REM Create core projects
echo ⚙️ Creating core projects...
dotnet new webapi -n UserManagement.Api
dotnet new classlib -n UserManagement.Application
dotnet new classlib -n UserManagement.Domain
dotnet new classlib -n UserManagement.Infrastructure

REM Remove default Class1.cs files
echo 🗑️ Removing default Class1.cs files...
if exist "UserManagement.Application\Class1.cs" del "UserManagement.Application\Class1.cs"
if exist "UserManagement.Domain\Class1.cs" del "UserManagement.Domain\Class1.cs"
if exist "UserManagement.Infrastructure\Class1.cs" del "UserManagement.Infrastructure\Class1.cs"

REM Create test projects
echo 🧪 Creating test projects...
dotnet new xunit -n UserManagement.UnitTests
dotnet new xunit -n UserManagement.IntegrationTests

REM Remove default test files
echo 🗑️ Removing default test files...
if exist "UserManagement.UnitTests\UnitTest1.cs" del "UserManagement.UnitTests\UnitTest1.cs"
if exist "UserManagement.IntegrationTests\UnitTest1.cs" del "UserManagement.IntegrationTests\UnitTest1.cs"

REM Add projects to solution
echo 🔗 Adding projects to solution...
dotnet sln add UserManagement.Api
dotnet sln add UserManagement.Application
dotnet sln add UserManagement.Domain
dotnet sln add UserManagement.Infrastructure
dotnet sln add UserManagement.UnitTests
dotnet sln add UserManagement.IntegrationTests

REM Set up project references (Clean Architecture style)
echo 📦 Setting up project references...
dotnet add UserManagement.Api reference UserManagement.Application
dotnet add UserManagement.Api reference UserManagement.Infrastructure
dotnet add UserManagement.Application reference UserManagement.Domain
dotnet add UserManagement.Infrastructure reference UserManagement.Domain

REM Add test project references
echo 🧪 Setting up test project references...
dotnet add UserManagement.UnitTests reference UserManagement.Domain
dotnet add UserManagement.UnitTests reference UserManagement.Application
dotnet add UserManagement.IntegrationTests reference UserManagement.Api

REM Create Domain layer folders
echo 🏛️ Creating Domain layer folders...
mkdir UserManagement.Domain\Aggregates
mkdir UserManagement.Domain\Entities
mkdir UserManagement.Domain\ValueObjects
mkdir UserManagement.Domain\DomainEvents
mkdir UserManagement.Domain\DomainServices
mkdir UserManagement.Domain\Specifications
mkdir UserManagement.Domain\Repositories
mkdir UserManagement.Domain\Exceptions
mkdir UserManagement.Domain\Common
mkdir UserManagement.Domain\Events

REM Create Application layer folders
echo ⚙️ Creating Application layer folders...
mkdir UserManagement.Application\Commands
mkdir UserManagement.Application\Queries
mkdir UserManagement.Application\Handlers
mkdir UserManagement.Application\DTOs
mkdir UserManagement.Application\Interfaces
mkdir UserManagement.Application\Behaviors
mkdir UserManagement.Application\EventHandlers
mkdir UserManagement.Application\Validators
mkdir UserManagement.Application\Mappings
mkdir UserManagement.Application\Common
mkdir UserManagement.Application\Common\Models
mkdir UserManagement.Application\Common\Exceptions

REM Create Infrastructure layer folders
echo 🔧 Creating Infrastructure layer folders...
mkdir UserManagement.Infrastructure\Data
mkdir UserManagement.Infrastructure\Repositories
mkdir UserManagement.Infrastructure\ExternalServices
mkdir UserManagement.Infrastructure\Migrations
mkdir UserManagement.Infrastructure\Configuration

REM Create API layer folders
echo 🌐 Creating API layer folders...
mkdir UserManagement.Api\Controllers
mkdir UserManagement.Api\Middleware
mkdir UserManagement.Api\Configuration
mkdir UserManagement.Api\Filters

echo ✅ Setup complete! UserManagement project is ready.
echo 📂 Navigate to UserManagement folder and open the solution:
echo    cd UserManagement
echo    code . or dotnet run --project UserManagement.Api
pause