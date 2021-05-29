# Top Museums  
# Description  
Application is produced to users who want to know all about all popular museums.

# Installation  
???????

# Usage  
???????

# Contributing
| Person           | Role          |
| -----------------|:-------------:|
| Andrey Kuksa     |Team Leader, Software Engineer  |
| Yavgeniy Belitsky|Project Architector             |
| Rodion Rutkevich | QA - specialist + build project|

# Features
- Registration and autorization system
- Navigation map
- Scroll view with custom active museum blocks
- Museum searching by db text searching

## Requirements  
### Software  
iOS 10 +
?????  
### Hardware  
?????  
## Requirements specification
### Funtional requirements
- Login page
    - Connect to database
    - Users have to register if they do not have an account. Login, Email, Password is required fields
    - Users have to login to use main functionality of App. Email, Password is required fields
    - Use switcher to choose login or register
- Main page
    - Show active block with museums pictures and name
    - If user clicks to museum active block App will show museum description
    - If user clicks to button "Find" App will show museums with names which contains text from text box
    - If user clcik to "View Map" button App will show map with all museums
    - Button "Back to main" switche off map-view

### Conviniences of use
- App is localized
- App protect your account
- App allow fast and easy museums searching
- App allow fast find a specific museum by name
- Simple and politician graphic interface

### Security requirements
- Connect to internet  
- Do not allow use App another person from government military structures
- App should function using by many users at the same time
- App should not use a large amount of memory with a small number of visitors
- A single database server must serve requests quickly when the server is under heavy load

### Performance requirements
- The system must support up to 2000 concurrent users
- Only 20 pictures should be stored in the application memory
 

