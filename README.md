# Stack Overflow project
### Goals: Use trello kanbon app to help track team work in developing product. 

* **General user:** test@test.com/ 123456
* **Admin user:** admin@example.com/ 123456
* Trello: https://trello.com/b/mfhX5WYK/stackflow

* [ERD](https://drive.google.com/open?id=1K5XTByAj6IP-FKGp6XRgk7SrmavP_ckn) / [Wireframe](https://drive.google.com/open?id=1uOjeakoEfWWJnPPHaw7axdn75ZNAhgoY)

* One-click with reconstructing necessary data: *rails dev:rebuild*

***
## Complete user story 

### Basics

- extend: user can post and answer after authentication

- extend: only admin and the person who asks and answers can delete the post/answer

- extend: authenticated user can ask a question with choices of relevant hashtags and can later search questions by certain tag.

- extend: user can create his/her own tag and delete one that has no questions belonged to 

### Advanced

- Admins can reset all users passwords by one click

- Use gem figaro to protect info/data in config from leaking while git pushing
