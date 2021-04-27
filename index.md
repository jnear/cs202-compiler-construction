---
title: CS 202: Compiler Construction
layout: default
---

# UVM CS202: Compiler Construction (Spring 2021)

## Announcements

- **1/29/21**: Update for spring 2021. This course will be in the
  **remote modality** for spring 2021. There will be no exams;
  instead, grades will be based on in-class exercises, homework
  assignments, and a final project. In spring 2021, the course will be
  **taught in Python**.


## Administrative

- **Lecture**: Monday, Wednesday, Friday, 10:50 - 11:40am (on MS Teams)
- **Instructor**: Joe Near (jnear at uvm dot edu)
- **Office hours**: Mondays, 3-4pm; Fridays, 4-5pm (on MS Teams)

## Course Description

This course covers the design and construction of compilers. You'll
learn how to translate a high-level, garbage-collected programming
language all the way into Intel x86 assembly language.

Instead of learning about each phase of the compilation process
sequentially, we'll start by compiling a tiny subset of the target
language directly into assembly code. Each week, we'll add a new
feature to our language, and learn about all the phases needed to
compile that feature into assembly. At each step, you'll have a
functioning compiler that can run real code; by the end of the course,
your compiler will work on a realistic programming language including
first-class functions.

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

- [Essentials of Compilation](https://github.com/jnear/cs202-compiler-construction/blob/master/book.pdf)  
  Jeremy Siek.

Other course resources:

- **Announcements** will be posted on the course Blackboard
- **Videos** from lecture are [available here](https://web.microsoftstream.com/group/13b5be7a-c4a1-41e9-b582-b81c8d8b19f7?view=videos)
- **Homework assignments**
  - Descriptions available in the list of assignments below
  - [Download assignment code on the course code repository](https://github.com/jnear/cs202-assignments)
  - Online compilers are available for each assignment (see links in the assignment description)
  - Turn in homework assignments on Blackboard
- **In-class exercises**
  - [Download notebooks here](https://github.com/jnear/cs202-assignments/tree/master/exercises)
  - Turn in notebook files on Blackboard


Additional/fun resources:

- Code from lectures is [available on Github](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures)
- The [midterm review sheet](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures/midterm-review.md) is available
- The [final review sheet](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures/final-review.md) is available
- Fun link: a [list of companies who need compiler developers!](https://mgaudet.github.io/CompilerJobs/)

# Policies

## Grading

Your grade for the course will be determined as follows:

- 7 homework assignments (8% each; 56% total)
- in-class exercises (30%)
- final project (14%)

Your final grade will be determined by summing the total number of
points awarded and calculating the percentage of the total possible
points. This percentage is translated into a letter grade as follows:

### Undergraduate Students

| Percent | Letter Grade |
| ------: | ------------ |
| 98-100  | A+           |
| 93-97   | A            |
| 90-92   | A-           |
| 87-89   | B+           |
| 83-86   | B            |
| 80-82   | B-           |
| 77-79   | C+           |
| 73-76   | C            |
| 70-72   | C-           |
| 67-69   | D+           |
| 63-66   | D            |
| 60-62   | D-           |
| <60     | F            |

### Graduate Students

| Percent | Letter Grade |
| ------: | ------------ |
| 98-100  | A+           |
| 93-97   | A            |
| 90-92   | A-           |
| 87-89   | B+           |
| 83-86   | B            |
| 80-82   | B-           |
| 77-79   | C+           |
| 73-76   | C            |
| 70-72   | C-           |
| <70     | F            |

## Assignments

Assignments will generally be due weekly on Mondays at 11:59pm,
with breaks for the midterm exam and final project. Your assignment
will be graded using a test suite which will be made available one day
before the assignment due date.

Late assignments will **not** be accepted. Each assignment builds
extensively on the last one, and mastering the assignment material is
crucial to success in this course. If you fall behind on completing
the assignments, it will be extremely difficult to catch up.

Therefore, on Wednesday after each assignment due date, we will
discuss that assignment's solution in lecture, and the complete
solution will be made available on Blackboard. I encourage students to
take advantage of the official solutions to avoid falling behind.

Partial credit will be (extensively) given on assignments. I encourage
you to submit *something* for every assignment, even if your solution
is far from complete.

Most assignments include a *challenge exercise*, which generally
involves extending your compiler with extra features or optimization
capabilities. Graduate students are required to complete all of the
challenge exercises, and the challenge exercise will account for 20%
of the total grade for the assignment. Undergraduates who successfully
complete the challenge exercise for an assignment will receive 5%
extra credit for that assignment.

Assignments will be graded according to the following rubric:

| Grade | Assignment Status                                         |
| ----: | -------------------                                       |
| 100   | Passes all test cases                                     |
| 95    | Passes 75% of test cases                                  |
| 90    | Passes 50% of test cases                                  |
| 85    | Passes at least 1 test case                               |
| 80    | Project compiles; all passes appear to be nearly complete |
| 75    | All or nearly all passes appear nearly complete           |
| 70    | Significant work on all passes                            |
| 65    | Significant work on at least 75% of the passes            |
| 60    | Significant work on at least half of the passes           |
| <60   | Missing passes                                            |

## In-Class Exercise

An *in-class exercise* will be due every Friday at 11:59pm. The
exercises for the week will be released on Monday morning, and we will
complete these exercises together during the lectures each week. If
you attend lectures and follow along, the in-class exercises should
not require significant additional time outside of lecture to
complete.

## Exams

There will be no exams.

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
  exercises. For graduate students, the challenge exercise will
  account for 20% of the assignment's total grade.

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

During the semester there will be ~5 guest lectures from visiting
faculty on MS Teams. I will give 0.5% extra credit towards your final
grade for each of these lectures that you attend. To receive extra
credit, you must take notes in person during the lecture, and then
e-mail me your notes after the talk. The guest lectures will take
place at 12-1pm on the following dates:

 - Friday, March 5
 - Tuesday, March 9
 - Friday, March 12
 - Monday, March 15
 - Wednesday, March 17


# Assignments

| Assignment  | Topics Covered                                                                                                            | Text Chapter  | Due Date         |
| ----------: | ---------------------------------                                                                                         | ------------- | ---------------- |
| 1           | [Compiling R0 to x86](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw1.md)                   | Chapter 1 & 2 | Feb 8, 11:59pm   |
| 2           | [Compiling RVar to x86](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw2.md)                 | Chapter 2     | Feb 22, 11:59pm  |
| 3           | [Register Allocation](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw3.md)                   | Chapter 3     | Mar 8, 11:59pm   |
| 4           | [Booleans and Control Flow (RIf)](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw4.md)       | Chapter 4     | Mar 22, 11:59pm  |
| 5           | [Vectors and Garbage Collection (Rvec)](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw5.md) | Chapter 5     | Apr 14, 11:59pm  |
| 6           | [Compiling Functions (Rfun)](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw6.md)            | Chapter 6     | May 3, 11:59pm   |
|             | Final Project                                                                                                             |               | *See below*      |

# Class Schedule

**Note: no class on Wednesday, March 24**


| Week of      | Topic                                          | Assignment         |
| -----------: | -----------------------------------            | ------------       |
| Feb 1        | ASTs, Interpreters, x86 Assembly, Compiling R0 |                    |
| Feb 8        | Compiling RInt                                 | A1 Due (Monday)    |
| Feb 15       | Compiling RInt                                 |                    |
| Feb 22       | Register allocation                            | A2 Due (Monday)    |
| Mar 1        | Register allocation                            |                    |
| Mar 8        | Booleans & Typechecking                        | A3 Due (Monday)    |
| Mar 15       | Compiling RIf                                  |                    |
| Mar 22       | *Intermission*                                 | A4 Due (Monday)    |
| Mar 29       | Vectors & Garbage collection I                 |                    |
| Apr 5        | Vectors & Garbage collection II                |                    |
| Apr 12       | Compiling functions I                          | A5 Due (Wednesday) |
| Apr 19       | Compiling functions II                         |                    |
| Apr 26       | Compiling first-class functions                |                    |
| May 3        | Dynamic typing & objects                       | A6 Due (Monday)    |
| May 10       | Optimization; binary & instruction sets        |                    |


# Final Projects

## Suggested Project Ideas

For each of these project ideas, a parser and lecture video will be
provided.

### Records (Simple Object System)

Extend the vectors present in RFun to *records* with *named
fields*. Record types are sufficient to implement a simple object
system, in which an object's methods are stored as functions in record
fields. There is no chapter in the textbook describing this extension,
but a parser and compiler template will be provided, as well as a
lecture video.

Example:

```
record Point {
  add: (Point, Point) -> Point,
  x: Integer,
  y: Integer
}

def addPoint(self: Point, other: Point): Point = {
  Point(self.add, self.x + other.x, other.x + other.y)
}

let p1 = Point(addPoint, 1, 2) in
let p2 = Point(addPoint, 3, 4) in
p1.add(p1, p2)
```

### Anonymous (Lexically-scoped) Functions

Extend the RFun language to support *anonmyous functions* (i.e. "lambda"
functions), as described in chapter 7 of the textbook. Your anonymous
functions should be lexically scoped. A parser, compiler template, and
lecture video will be provided.

Example:

```
let x = 5 in
let f = lambda y: Integer -> x + y
in f(6)
```

### Dynamic Typing

Extend the RFun language to support *dynamic typing* as described in
chapter 8 of the textbook. A parser, compiler template, and lecture
video will be provided.

Example:

```
42 == (if 5 == 5 then 42 else True)
```

## Other Project Ideas

  * anonymous functions
  * cons lists
    * with vectors
    * improved tags
    * datatypes / pattern matching
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
- A *project presentation* of about 5 minutes, including
  - A description of the new feature, including a test case
  - Your implementation approach
  - A description of challenges you encountered / parts you were not able to implement
  - You will submit a video of your project presentation at the same time as your project implementation and README

## Schedule & Grading

The final project is worth 14% of your final grade. The schedule for final project deliverables, and the contribution of each one to the grade you receive for the final project, are as follows:

| Deliverable              | Due Date                  | Grade Percent | Turn In    |
| -----------------------: | -------------------       | ------------- | --------   |
| Project Proposal         | Monday, May 3 at 11:59pm  | 10%           | Blackboard |
| Implementation & README  | Monday, May 17 at 11:59pm | 50%           | Blackboard |
| Project Presentations    | Monday, May 17 at 11:59pm | 30%           | Blackboard |





