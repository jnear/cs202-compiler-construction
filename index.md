---
title: CS 295F: Compiler Construction
layout: default
---

# UVM CS295F: Compiler Construction (Spring 2019)

## Announcements

- **4/14/19**: Project proposals are delayed by one day so that they're not due on the same day as A6.

- **4/3/19**: [Assignment 6](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw6.md) is posted.

- **3/28/19**: Office hours have been changed to split between Monday and Friday.

- **3/19/19**: [Assignment 5](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw5.md) is posted, and the schedule has been adjusted for this assignment and future lectures.

- **2/21/19**: [Assignment 4](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw4.md) is posted.

- **2/17/19**: I've extended the due date for Assignment 3 to Tuesday,
    February 19, due to the holiday on Monday.

- **2/13/19**: [Assignment 3](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw3.md) is posted.

- **1/29/19**: I've updated the link to the course textbook to point
    at the [revised
    version](https://github.com/jnear/cs295-compiler-construction/blob/master/book.pdf),
    which has important changes to the `C0` language.

## Administrative

- **Lecture**: Tuesday and Thursday, 2:50pm - 4:05pm, Kalkin 325
- **Instructor**: Joe Near (jnear at uvm dot edu)
- **Office hours**: Mondays, 11am-noon, and Fridays, 3:00pm - 4:00pm; Votey 317

## Course Description

This course covers the design and construction of compilers. You'll
learn learn how to translate Racket, a dialect of Scheme, all the way
into Intel x86 assembly language.

Instead of learning about each phase of the compilation process
sequentially, we'll start by compiling a tiny subset of Racket
directly into assembly code. Each week, we'll add a new feature to our
language, and learn about all the phases needed to compile that
feature into assembly. At each step, you'll have a functioning
compiler that can run real code; by the end of the course, your
compiler will work on a large subset of Racket including first-class
functions.

Topics covered include:

- representation and analysis of code
- register allocation
- static type checking
- mutable data
- garbage collection
- first-class functions and closure conversion

This course will be structured around lectures and a weekly
programming assignment. Each lecture will cover a new language feature
and the techniques needed to compile it; in the corresponding
programming assignment, you will implement support for the new feature
in your own compiler. Students should expect to spend 6-8 hours per
week outside of class on the weekly programming assignments. The
required materials for this course are all freely available online.

Students will also complete a final project, in which they extend
their compiler with an additional significant language feature of
their choice.

Graduate students are expected to complete additional *challenge
exercises* included in each assignment, and to select more ambitious
final projects compared to undergraduate students.

This course is primarily intended for computer science students, but
may also be appropriate for some graduate students in other areas with
an interest in programming languages and strong programming
experience.

Prerequisites: CS124 and CS125

## Text and Resources

Please **do not** buy any books for this course. All required reference material is available online for free.

The primary textbook we will use for this course is:

- [Essentials of Compilation](https://github.com/jnear/cs295-compiler-construction/blob/master/book.pdf)  
  Jeremy G. Siek and Ryan R. Newton.

For questions about Racket, course material, or assignments, post to
Piazza. Feel free to answer others' questions, but please do not share
code or solutions. You can access Piazza here:

- [CS295F Piazza](https://piazza.com/uvm/spring2019/cs295f)

Other resources:

- Download the [Racket Distribution](https://download.racket-lang.org/)
- Code from lectures is [available on Github](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures)
- The [midterm review sheet](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures/midterm-review.md) is available

# Policies

## Grading

Your grade for the course will be determined as follows:

- 8 homework assignments (7% each; 56% total)
- midterm exam (15%)
- final exam (15%)
- final project (14%)

Your final grade will be determined by summing the total number of
points awarded and calculating the percentage of the total possible
points. This percentage is translated into a letter grade as follows:

### Undergraduate Students

|Percent | Letter Grade |
| ------:| ------------ |
| 98-100 | A+ |
| 93-97  | A  |
| 90-92  | A- |
| 87-89  | B+ |
| 83-86  | B  |
| 80-82  | B- |
| 77-79  | C+ |
| 73-76  | C  |
| 70-72  | C- |
| 67-69  | D+ |
| 63-66  | D  |
| 60-62  | D- |
| <60    | F  |

### Graduate Students

|Percent | Letter Grade |
| ------:| ------------ |
| 98-100 | A+ |
| 93-97  | A  |
| 90-92  | A- |
| 87-89  | B+ |
| 83-86  | B  |
| 80-82  | B- |
| 77-79  | C+ |
| 73-76  | C  |
| 70-72  | C- |
| <70    | F  |

## Assignments

Assignments will generally be due bi-weekly on Mondays at 11:59pm,
with breaks for the midterm exam and final project. Your assignment
will be graded using a test suite which will be made available one day
before the assignment due date.

Assignments may be turned in late for a penalty of 10% per
day after the deadline. Assignments more than 10 days late will not be
accepted.

Each assignment includes a *challenge exercise*, which generally
involves extending your compiler with extra features or optimization
capabilities. Graduate students are required to complete all of the
challenge exercises; undergraduates who successfully complete the
challenge exercise for an assignment will receive 5% extra credit for
that assignment.

## Final Projects

Each student will select and complete a new language feature for their
compiler. Final project deliverables will consist of a short project
proposal, a compiler implementing the selected language feature, and
test cases demonstrating its use. Final projects may be completed in
teams of up to 3 students; larger teams will be expected to complete
more ambitious projects.

## Graduate Students

Graduate students will be expected to complete additional requirements
in order to receive graduate credit for this course:

- Graduate students are expected to complete all of the challenge
  exercises. The weighting of each challenge exercise will be noted in
  the assignment, and will generally account for 20-40% of the total
  grade for the assignment.

- Graduate students are expected to select and complete more ambitious
  final projects. Suggested topics for graduate student final projects
  will be included in the detailed final project information.


## Collaboration & Allowed References

Collaboration on the high-level ideas and approach on assignments is
encouraged. Copying someone else's work (outside of your team
members) is not allowed.

The official references for the course are listed in the schedule
below. Copying from references other than these is not allowed. In
particular, code should not be copied from other sources, including
Stack Overflow and other public sources.

Students caught copying work are eligible for immediate failure of the
course and disciplinary action by the University. All academic
integrity misconduct will be treated according to [UVM's Code of
Academic
Integrity](https://www.uvm.edu/policies/student/acadintegrity.pdf).

## Guest Lectures & Extra Credit

During the semester there will be ~7 guest lectures from visiting
faculty. I will give 0.5% extra credit towards your final grade for
each of these lectures that you attend. To receive extra credit, you
must bring a notepad to the lecture, take notes in person during the
lecture, and then turn your notes in to the instructor personally at
the end of the talk. If you attend all lectures you will receive a
~3.5% bump to your final grade.

 - Guest Lecture 1: Tuesday, February 12, 12–1pm, John Dewey Lounge(Systems Security)
 - Guest Lecture 2: Thursday, February 14, 12–1pm, Perkins 101 (CS Theory)
 - Guest Lecture 3: Tuesday, February 19, 12–1pm, John Dewey Lounge (Systems Security)
 - Guest Lecture 4: Friday, February 22, 12–1pm, Perkins 101 (Systems Security)
 - Guest Lecture 5: Tuesday, February 26, **1–2pm**, John Dewey Lounge (Systems Security)
 - Guest Lecture 6: Thursday, February 28, 12-1pm, Perkins 101 (CS Theory)
 - Guest Lecture 7: Friday, March 01, 12–1pm, Perkins 101 (Systems Security)

# Assignments

| Assignment | Topics Covered                    | Text Chapter  | Due Date         |
| ----------:| --------------------------------- | ------------- | ---------------- |
| 1          | [Interpreters & partial evaluation](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw1.md) | Chapter 1 & 2 | Jan 28, 11:59pm  |
| 2          | [Compiling R_1 to x86](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw2.md)              | Chapter 2     | Feb 11, 11:59pm  |
| 3          | [Using the Stack](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw3.md)                   | Chapter 2     | Feb 19, 11:59pm  |
| 4          | [Register Allocation](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw4.md)               | Chapter 3     | Mar 4,  11:59pm  |
| -          | Midterm Exam                      | 1 - 4         | Mar 7 (in class) |
| 5          | [Booleans and Control Flow](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw5.md)         | Chapter 4     | Apr 1, 11:59pm  |
| 6          | [Tuples and Garbage Collection](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw6.md)     | Chapter 5     | Apr 15, 11:59pm  |
| 7          | Compiling Functions               | Chapter 6     | Apr 22, 11:59pm  |
| 8          | ~~Compiling First-Class Functions~~   | Chapter 7     | *cancelled*  |
|            | Final Project                     |               | *See below*      |
| -          | Final Exam                        | 5 - 7         | May 9,  1:30pm   |

# Class Schedule

| Date        | Topic                               | Assignment   |
| -----------:| ----------------------------------- | ------------ |
| Tue, Jan 15 | Welcome & Racket                    |              |
| Thu, Jan 17 | ASTs & Interpreters                 | A1 Released  |
| Tue, Jan 22 | NO CLASS                            |              |
| Thu, Jan 24 | Partial evaluation                  |              |
| Tue, Jan 29 | x86 Assembly                        | A2 Released  |
| Thu, Jan 31 | Compiling R1 I                      |              |
| Tue, Feb 05 | Compiling R1 II                     |              |
| Thu, Feb 07 | Using the stack I                   |              |
| Tue, Feb 12 | Random testing                      | A3 Released  |
| Thu, Feb 14 | Using the stack II                  |              |
| Tue, Feb 19 | Register allocation I               |              |
| Thu, Feb 21 | Register allocation II              | A4 Released  |
| Tue, Feb 26 | Booleans & Typechecking             |              |
| Thu, Feb 28 | REVIEW FOR MIDTERM                  |              |
| Tue, Mar 05 | NO CLASS: Town Meeting Day          |              |
| Thu, Mar 07 | MIDTERM                             |              |
| Tue, Mar 12 | NO CLASS: Spring Break              |              |
| Thu, Mar 14 | NO CLASS: Spring Break              |              |
| Tue, Mar 19 | Compiling Booleans I                | A5 Released  |
| Thu, Mar 21 | Compiling Booleans II               |              |
| Tue, Mar 26 | Tuples & Garbage collection I       |              |
| Thu, Mar 28 | Tuples & Garbage collection II      | A6 Released  |
| Tue, Apr 02 | Tuples & Garbage collection III     |              |
| Thu, Apr 04 | Compiling Functions I               |              |
| Tue, Apr 09 | Compiling Functions II              |              |
| Thu, Apr 11 | Compiling Functions III (tco)       | A7 Released  |
| Tue, Apr 16 | Compiling first-class functions I   |              |
| Thu, Apr 18 | Compiling first-class functions II  |              |
| Tue, Apr 23 | Compiling first-class functions III |              |
| Thu, Apr 25 | Dynamic typing                      |              |
| Tue, Apr 30 | Project Presentations I             |              |
| Thu, May 02 | Project Presentations II            |              |
| Thu, May 09 | FINAL EXAM (1:30pm, Kalkin 325)     |              |

# Final Projects

## Project Ideas

  * anonymous functions
  * cons lists
    * with vectors
    * improved tags
    * quasiquote / match
  * vectors with non-statically-known indexing (runtime checking)
  * objects
    * records with named fields (from vectors)
    * functions in fields (methods w/ dynamic dispatch)
    * classes & inheritance

More complicated:

  * loops and loop optimization
  * lazy evaluation
  * procedure inlining
  * continuations, exceptions
  * I/O
  * foreign function interface

Very tough: 

  * self hosting
  * macros
  * alternative garbage collector
  * multi-threading, fork join, futures, implicit parallelism

## Requirements

The goal of the final project is for you to design and implement your own compiler extension. Final projects will be completed in groups of 1-3. The deliverables for the project will be as follows:

- A *project proposal* of 1 paragraph, describing:
  - Who is in your group
  - A description of your desired compiler feature (language feature or compiler extension - e.g. "add objects and class definitions with inheritance")
  - A description of the *most scaled-back feasible version* of your compiler feature - e.g. "use vectors containing values and functions to represent objects")
  - A representative test case to demonstrate your new feature
- Your *implementation*, as an extension to the course compiler
  - Include at least 10 representative test cases demonstrating your new feature
- A *README* of at most 1 page, describing the approach you took in your implementation, and features you planned but did not implement
- A *project presentation* of about 10 minutes, including
  - A description of the new feature, including a test case
  - Your implementation approach
  - A description of challenges you encountered / parts you were not able to implement

## Schedule & Grading

The final project is worth 14% of your final grade. The schedule for final project deliverables, and the contribution of each one to the grade you receive for the final project, are as follows:

| Deliverable             | Due Date            | Grade Percent | Turn In  |
| -----------------------:| ------------------- | ------------- | -------- |
| Project Proposal        | 4/16/19 at 11:59pm  | 10%           | By email |
| Implementation & README | 5/6/19 at 11:59pm   | 60%           | By email |
| Project Presentations   | 5/2/19 in class     | 30%           | In class |
