- **Get Movie Recommendations Usecase**
    - Use case :
        1. System receives the id of a movie
        2. System makes a request to the API on endpoint recommendation passing the movie id
        3. System validates request data
        4. System returns data received from API
    - Exception :
        1. 401 : System returns access denied message
        2. 404 : System returns unexpected error message