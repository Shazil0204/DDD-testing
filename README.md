# UserManagement - Clean Architecture & DDD Learning Project

## 🎯 What Is This?

This is a **User Management System** built with **Clean Architecture** and **Domain-Driven Design (DDD)** principles. We'll create a simple **CRUD system** for users (Create, Read, Update, Delete) to learn how each layer and folder works.

**What we'll build:**

- ✅ Create a new user
- ✅ Get user details
- ✅ Update user information
- ✅ Delete a user
- ✅ List all users

Think of it like building a house with a strong foundation and clear rooms for different purposes.

## 🏗️ Step-by-Step Explanation

### 1. Create the Main Folder

```bash
mkdir UserManagement
cd UserManagement
```

- **What it does**: Creates a main folder called "UserManagement" and goes inside it
- **Why**: This is like creating the land where you'll build your house

### 2. Create the Solution File

```bash
dotnet new sln -n UserManagement
```

- **What it does**: Creates a solution file (`.sln`) that acts like a "master list" of all your projects
- **Why**: Like a blueprint that shows all the rooms in your house and how they connect

### 3. Create the Core Projects

```bash
dotnet new webapi -n UserManagement.Api
dotnet new classlib -n UserManagement.Application
dotnet new classlib -n UserManagement.Domain
dotnet new classlib -n UserManagement.Infrastructure
```

**What each project does:**

- **🌐 UserManagement.Api** - The "front door" of your app (REST API)
  - Handles HTTP requests (GET, POST, PUT, DELETE)
  - Like the reception desk that talks to customers

- **⚙️ UserManagement.Application** - The "business logic coordinator"
  - Organizes what the app should do (use cases)
  - Like the manager who decides how to handle customer requests

- **🏛️ UserManagement.Domain** - The "heart of your business"
  - Contains your core business rules and data models (User entity, Email value object)
  - Like the company's core policies and procedures

- **🔧 UserManagement.Infrastructure** - The "technical stuff"
  - Like the plumbing and electrical work

### 4. Create Test Projects

```bash
dotnet new xunit -n UserManagement.UnitTests
dotnet new xunit -n UserManagement.IntegrationTests
```

- **🧪 UnitTests**: Tests individual pieces of code in isolation
- **🔄 IntegrationTests**: Tests how all pieces work together
- **Why**: Like quality control to make sure everything works correctly

### 5. Add Projects to Solution

```bash
dotnet sln add UserManagement.Api
dotnet sln add UserManagement.Application
dotnet sln add UserManagement.Domain
dotnet sln add UserManagement.Infrastructure
dotnet sln add UserManagement.UnitTests
dotnet sln add UserManagement.IntegrationTests
```

- **What it does**: Tells the solution file about all your projects
- **Why**: Like updating the house blueprint to show all the rooms

### 6. Connect the Projects (References)

```bash
dotnet add UserManagement.Api reference UserManagement.Application
dotnet add UserManagement.Api reference UserManagement.Infrastructure
dotnet add UserManagement.Application reference UserManagement.Domain
dotnet add UserManagement.Infrastructure reference UserManagement.Domain
```

**🔗 How They Connect:**

```
API (Front Door)
├── Application (Manager)
├── Infrastructure (Plumbing)
└── Domain (Core Rules) ← Everyone uses this
```

**Why This Way:**

- The **API** brings everything together (like a conductor)
- **Application** and **Infrastructure** both use **Domain** (core rules)
- But **Application** and **Infrastructure** don't know about each other
- This keeps things organized and easy to change

## 📁 Folder Structure Explained

### 🏛️ Domain Layer Folders

The **heart** of your business - contains the "what" of your application:

**What we'll put here for User CRUD:**

- **Aggregates** - `UserAggregate.cs` (groups User entity with related business rules)
- **Entities** - `User.cs` (the main User object with Id, methods)
- **ValueObjects** - `Email.cs`, `FullName.cs` (immutable values that describe a user)
- **DomainEvents** - `UserCreated.cs`, `UserUpdated.cs`, `UserDeleted.cs`
- **DomainServices** - `UserDomainService.cs` (complex user operations)
- **Specifications** - `UserIsActive.cs`, `UserEmailIsUnique.cs` (business rules)
- **Repositories** - `IUserRepository.cs` (contract for saving/loading users)
- **Exceptions** - `UserNotFoundException.cs`, `DuplicateEmailException.cs`
- **Common** - Base classes, shared value objects
- **Events** - Additional event organization

### ⚙️ Application Layer Folders

The **coordinator** - contains the "how" of your application:

**What we'll put here for User CRUD:**

- **Commands** - `CreateUserCommand.cs`, `UpdateUserCommand.cs`, `DeleteUserCommand.cs`
- **Queries** - `GetUserByIdQuery.cs`, `GetAllUsersQuery.cs`
- **Handlers** - `CreateUserHandler.cs`, `GetUserByIdHandler.cs` (processes commands/queries)
- **DTOs** - `UserDto.cs`, `CreateUserDto.cs`, `UpdateUserDto.cs` (data transfer objects)
- **Interfaces** - Contracts that other layers must follow
- **Behaviors** - `ValidationBehavior.cs`, `LoggingBehavior.cs` (common actions)
- **EventHandlers** - `UserCreatedEventHandler.cs` (responds to domain events)
- **Validators** - `CreateUserValidator.cs`, `UpdateUserValidator.cs` (input validation)
- **Common/Models** - Shared response objects
- **Common/Exceptions** - Application-specific errors

### 🔧 Infrastructure Layer Folders

The **technical implementation** - the actual "doing":

**What we'll put here for User CRUD:**

- **Data** - `UserDbContext.cs`, `UserEntityConfiguration.cs` (database setup)
- **Repositories** - `UserRepository.cs` (actual database operations)
- **ExternalServices** - `EmailService.cs` (if we need to send emails)
- **Migrations** - Database structure changes over time
- **Configuration** - Setup for databases, external services, etc.

### 🌐 API Layer Folders

The **front door** - handles communication with the outside world:

**What we'll put here for User CRUD:**

- **Controllers** - `UsersController.cs` (HTTP endpoints like GET /users, POST /users)
- **Middleware** - Authentication, error handling
- **Configuration** - API-specific settings
- **Filters** - Code that runs before/after controller actions

## 🎯 Why This Structure?

### ✅ **Benefits**

1. **Easy to Understand** - Each layer has a clear purpose
2. **Easy to Test** - You can test each part separately
3. **Easy to Change** - Changing database doesn't break business rules
4. **Team Friendly** - Different teams can work on different layers
5. **Follows Industry Standards** - This is how big companies structure their code

### 🏆 **Industry Approval**

This structure is recommended by:

- **Microsoft** (in their official .NET documentation)
- **Uncle Bob Martin** (Clean Architecture book)
- **Eric Evans** (Domain-Driven Design book)
- **Major companies** like Netflix, Amazon, Google

## 🚀 Getting Started

1. Run all the commands in order
2. Open the solution in Visual Studio or VS Code
3. Start building your User CRUD features following this structure
4. Your future self (and teammates) will thank you!

## 📋 What We'll Build (User CRUD System)

**API Endpoints we'll create:**

- `GET /api/users` - Get all users
- `GET /api/users/{id}` - Get user by ID
- `POST /api/users` - Create new user
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user

**User Properties:**

- ID (unique identifier)
- First Name
- Last Name
- Email Address
- Date Created
- Is Active

**What you'll learn:**

- ✅ How to structure domain entities and value objects
- ✅ Where to put business rules and validation
- ✅ How to implement CQRS (Command Query Separation)
- ✅ How layers communicate through interfaces
- ✅ How to handle domain events
- ✅ Proper dependency injection setup
- ✅ Unit and integration testing patterns

---

_This structure might seem like a lot at first, but it will save you tons of time as your application grows!_ 🌟
