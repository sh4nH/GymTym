# GymTym Application

## General Info

Frontend for GymTym Application

Problem Motivation : Gym Traffic varies through the day and follows a pattern based on users' timetables, but a user doesn't know when a gym is least likely to be crowded during his/her free time. 

Proposed Level of Achievment : Apollo 11

Proposed Core Features : Login and Registration of Users, Provide optimal time slots upon input of NUSMods Timetable link, Chat and Find a buddy features

The gym-tym app primarily aims to inform the user, the best possible time slots to use the gym (when it is least crowded). Additional features we are looking at include a feature that helps find gym buddies with similar free time. For this milestone, the frontend for login, registration and displaying the timeslots has been created and the scraper has been created to scrape data at scheduled intervals and add it to our MySQL database. With a bit of modifications to be made to the database (we need it to store the average of all scraped values instead of the most recent), we will soon be hosting the scraper on Heroku.

For the scraping, the BeautifulSoup Library in Python was used to scrape live gym traffic data from REBOKS (Pool and Gym Traffic - NUS). The Scraping was automated using APScheduler, a Python library to automate tasks. The database has been created for daily tasks on MySQL. Future iterations of this project will include hosting this scraper on Heroku and connecting it to a MySQL Database. APScheduler was chosen over crontab as the Python Library to Schedule the scrape at regular intervals as crontab is targetted at single-system applications.

A choice had to be made between MySQL and MongoDB. MySQL was chosen due to the compliance of our scraped data with relational paradigms. Each timeslot has an average traffic, and thus SQL was chosen over NoSQL as it met our needs. Number of difficulties were faced in the process of producing this iteration. For the frontend, there were compatibility issues in importing various dart packages. The Android Emulator took long time to run, making debugging difficult.

**Milestone 2**

The backend logic for the key feature (suggestion of timeslots) was completed for milestone 2. The web scraper was deployed to an AWS EC2 Linux instance and automated to scrape from NUS REBOKS at 20 minute intervals between 7 AM to 9 PM and inject the scraped data into a MySQL Database. A cron job was used to automate the scraping. An AWS RDS instance was created, and the database was initialized by migrating Django models. The scraper has been live since yesterday (Sun, 26 Jun 2022) and below is the data scraped so far: 

<img width="420" alt="image" src="https://user-images.githubusercontent.com/95856653/175947320-6d858d83-0959-42a9-b0b6-746102e41137.png">

A REST API was built using Django's MVT pattern. Django Models were used to interact with and initialize the SQL database. Django views were designed to respond to HTTP Requests and provide the adequate responses, as shown below: 

<img width="1280" alt="image" src="https://user-images.githubusercontent.com/95856653/175950138-64236104-bd55-4cf0-98d4-ba8c259846b7.png">

The responses above are provided in a JSON Format and do not alter the state of the server, as per RESTful API principles. The API is yet to be deployed to Amazon Web API Gateway, thus dummy values are being used for frontend.

Problems encountered : 

1) Initially, the scraper used the APScheduler library to schedule the scrape. The architecture was pretty complicated- I had to use a
   combination of triggers and a job store. However, the Heroku dynos slept after 30 minutes of inactivity unless I'd paid(my scraper is inactive during
   the night as the gym isn't open then). Thus, I decided to switch to AWS EC2, as it also provided me the opportunity to separate the scraping
   logic from the scheduling logic using a cron job. 

2) The cron job took more than a day to set in place. Despite the fact that I set the Local and RTC Timezone of the Server to Asia/Singapore, 
   the cronjob for some reason kept scraping at UTC time. Setting the CRON_TMZ env variable to Asia/Singapore yielded no benefits either. What 
   made debugging this very difficult was the fact that my Python code (web scraper) ran correctly in SGT.
   
 For Milestone 3, we will be adding a chat feature and a find a buddy feature for finding a partner with a similar training plan to hit the gym together.

**Tech Stack**
  
  Frontend: Flutter
  
  Backend: Firebase, Django, SQL, AWS
  

![login](https://user-images.githubusercontent.com/88987178/175844778-c3fb917c-9900-4fc0-9710-3f3cd53e6634.jpg)


![login w keyboard](https://user-images.githubusercontent.com/88987178/175844799-13d3a96c-d88e-4c60-81a2-779c6c698f51.jpg)


![sign up page](https://user-images.githubusercontent.com/88987178/175844821-e3017b53-cc91-4e39-8b72-a1eed890ecdb.jpg)


![Screenshot 2022-06-27 052232](https://user-images.githubusercontent.com/88987178/175844859-e731cdc8-e60c-4406-9330-57f1c2fd3108.jpg)


![Screenshot 2022-06-27 052339](https://user-images.githubusercontent.com/88987178/175844865-c95d5025-7dd8-4ef2-bc28-f9a92fdb7c18.jpg)













