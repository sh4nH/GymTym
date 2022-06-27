# GymTym Application

Problem Motivation : Gym Traffic varies through the day and follows a pattern based on users' timetables, but a user doesn't know when a gym is least likely to be crowded during his free time. 

Proposed Core Features : Login Page, Registration page, Welcome page

The gym-tym app primarily aims to inform the user, the best possible time slots to use the gym (when it is least crowded). Additional features we are looking at include a feature that helps find gym buddies with similar free time. For this milestone, the frontend for login, registration and displaying the timeslots has been created and the scraper has been created to scrape data at scheduled intervals and add it to our MySQL database. With a bit of modifications to be made to the database (we need it to store the average of all scraped values instead of the most recent), we will soon be hosting the scraper on Heroku.

For the scraping, the BeautifulSoup Library in Python was used to scrape live gym traffic data from REBOKS (Pool and Gym Traffic - NUS). The Scraping was automated using APScheduler, a Python library to automate tasks. The database has been created for daily tasks on MySQL. Future iterations of this project will include hosting this scraper on Heroku and connecting it to a MySQL Database. APScheduler was chosen over crontab as the Python Library to Schedule the scrape at regular intervals as crontab is targetted at single-system applications.

A choice had to be made between MySQL and MongoDB. MySQL was chosen due to the compliance of our scraped data with relational paradigms. Each timeslot has an average traffic, and thus SQL was chosen over NoSQL as it met our needs. Number of difficulties were faced in the process of producing this iteration. For the frontend, there were compatibility issues in importing various dart packages. The Android Emulator took long time to run, making debugging difficult.

Login page developed using Flutter frontend and linked to Firebase backend for email-password authentication

![login](https://user-images.githubusercontent.com/88987178/175844778-c3fb917c-9900-4fc0-9710-3f3cd53e6634.jpg)

![login w keyboard](https://user-images.githubusercontent.com/88987178/175844799-13d3a96c-d88e-4c60-81a2-779c6c698f51.jpg)

![sign up page](https://user-images.githubusercontent.com/88987178/175844821-e3017b53-cc91-4e39-8b72-a1eed890ecdb.jpg)

![Screenshot 2022-06-27 052232](https://user-images.githubusercontent.com/88987178/175844859-e731cdc8-e60c-4406-9330-57f1c2fd3108.jpg)

![Screenshot 2022-06-27 052339](https://user-images.githubusercontent.com/88987178/175844865-c95d5025-7dd8-4ef2-bc28-f9a92fdb7c18.jpg)











