## Datasets

The data used is from Northwestern's [Course and Teacher Evaluation Council (CTEC)](https://www.northwestern.edu/ctec) system, which is data available to students at Northwestern University. These evaluations provide ratings made by previous students regarding various Northwestern courses and their instructor(s), including information like how much time the student spent on the course, what degree requirements the course fulfilled for the student, what year and school the student is in, and ratings of the instruction and the course across several categories. 

The data used in this project was scraped from [CTEC data](https://www.northwestern.edu/ctec) from the most recent academic year (2022-23) across six representative course departments, for each of the six Northwestern schools: 

1. Psychology (PSYCH) for Weinberg,
2. Civil and Environmental Engineering (CIV_ENV) for McCormick,
3. Music (MUSIC) for Bienen, 
4. Communication Studies (COMMS) for the School of Communications,
5. Journalism (JOUR) for Medill,
6. and School of Education & Social Policy Core (SESP) for SESP.


The data has a total of **5137 objects** across **12 variables**.

1. `school`: categorical variable; the school the department is from -- denoted `mcmk` for McCormick, `jour` for Medill, `comm` for Comms, `bien` for Bienen, `sesp` for SESP, and `wnbg` for Weinberg
2. `dept`: categorical variable; the department the course is offered through -- denoted `psych` for Psychology, `sesp` for SESP Core, `music` for Music, `comm_st` for Communication Studies , `jour` for Journalism, and `civ_env` for Civil and Environmental Engineering
3. `course_num`: the three digit course number
4. `course_term`: categorical variable; the quarter the course was offered -- denoted `fall` for Fall 2022, `winter` for Winter 2023, and `spring` for Spring 2023
5. `instructor`: the name of the instructor
6. `inst_rating`: the mean of students' responses to the prompt, *"Provide an overall rating of the instruction,"* rated out of 6
7. `course_rating`: the mean of students' responses to the prompt, *"Provide an overall rating of the course,"* rated out of 6
8. `learn_rating`: the mean of students' responses to the prompt, *"Estimate how much you learned in the course,"* rated out of 6
9. `challenge_rating`: the mean of students' responses to the prompt, *"Rate the effectiveness of the course in challenging you intellectually,"* rated out of 6
10. `interest_rating`: the mean of students' responses to the prompt, *"Rate the effectiveness of the instructor in stimulating your interest in the subject,"* rated out of 6
11. `hours_spent`: the mean of students' responses to the prompt, *"Estimate the average number of hours per week you spent on this course outside of class and lab time."*
12. `essay`: text responses to the prompt, *"Please summarize your reaction to this course focusing on the aspects that were most important to you."*

