---
title: CS 202: Compiler Construction
layout: default
---

# UVM CS202: Compiler Construction (Spring 2020)

## Announcements

None yet.

## Administrative

- **Lecture**: Tuesday & Thursday, 2:50-4:05pm, Votey 207
- **Instructor**: Joe Near (jnear at uvm dot edu)
- **Office hours**: Mondays 10am-11am and Fridays 10am-11am, Innovation E458

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
  Jeremy G. Siek and Ryan R. Newton.

For questions about Haskell, course material, or assignments, post to
Piazza. Feel free to answer others' questions, but please do not share
code or solutions. You can access Piazza here:

- [CS202 Piazza](https://piazza.com/class/k55pkykniwv5sp?cid=1)

Code and resources for assignments:

- Assignment code & Haskell info is [on the course code repository](https://github.com/jnear/cs202-assignments)
- Online compilers are available for each assignment (see links in the assignment description)

Other resources:

- Code from lectures is [available on Github](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures)
- The [midterm review sheet](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures/midterm-review.md) is available
- The [final review sheet](https://github.com/jnear/cs202-compiler-construction/tree/master/lectures/final-review.md) is available

# Policies

## Grading

Your grade for the course will be determined as follows:

- 7 homework assignments (8% each; 56% total)
- midterm exam (15%)
- final exam (15%)
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

Therefore, on Tuesday after each assignment due date, we will discuss
that assignment's solution in lecture, and the complete solution will
be made available on Blackboard. I encourage students to take
advantage of the official solutions to avoid falling behind.

Partial credit will be (extensively) given on assignments. I encourage
you to submit *something* for every assignment, even if your solution
is far from complete.

Each assignment includes a *challenge exercise*, which generally
involves extending your compiler with extra features or optimization
capabilities. Graduate students are required to complete all of the
challenge exercises; undergraduates who successfully complete the
challenge exercise for an assignment will receive 5% extra credit for
that assignment.

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


## Exams

There will be two exams:

- An in-class midterm exam on March 5
- A final exam on May 7 at 1:30pm in Votey 207

The exams will not be cumulative: the midterm will cover the material
from the first four assignments, and the final will cover the material
from the last three assignments and subsequent lectures.

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

During the semester there will be ~3 guest lectures from visiting
faculty. I will give 0.5% extra credit towards your final grade for
each of these lectures that you attend. To receive extra credit, you
must bring a notepad to the lecture, take notes in person during the
lecture, and then turn your notes in to the instructor personally at
the end of the talk.

 - Guest Lecture 1: TBA
 - Guest Lecture 2: TBA
 - Guest Lecture 3: TBA

# Assignments

| Assignment  | Topics Covered                                                                                          | Text Chapter  | Due Date                 |
| ----------: | ---------------------------------                                                                       | ------------- | ----------------         |
| 1           | [Compiling R0 to x86](https://github.com/jnear/cs202-compiler-construction/blob/master/homework/hw1.md) | Chapter 1 & 2 | Jan 27, 11:59pm          |
| 2           | Compiling R1 to x86                                                                                     | Chapter 2     | Feb 10, 11:59pm          |
| 3           | Register Allocation                                                                                     | Chapter 3     | Feb 17, 11:59pm          |
| 4           | Booleans and Control Flow (R3)                                                                          | Chapter 4     | Mar 2, 11:59pm           |
| -           | Midterm Exam                                                                                            | 1 - 4         | Mar 5 (in class)         |
| 5           | Vectors and Garbage Collection (R4)                                                                     | Chapter 5     | Mar 30, 11:59pm          |
| 6           | Compiling Functions (R5)                                                                                | Chapter 6     | Apr 6, 11:59pm           |
| 7           | Compiling First-Class Functions (R6)                                                                    | Chapter 7     | Apr 13, 11:59pm          |
|             | Final Project                                                                                           |               | *See below*              |
| -           | Final Exam                                                                                              | 5 - 7         | May 7, 1:30pm, Votey 207 |

# Class Schedule

| Date         | Topic                                        | Assignment      |
| -----------: | -----------------------------------          | ------------    |
| Tue, Jan 14  | Welcome & Haskell                            |                 |
| Thu, Jan 16  | ASTs & Interpreters                          |                 |
| Tue, Jan 21  | x86 Assembly                                 |                 |
| Thu, Jan 23  | Compiling R0                                 |                 |
| Tue, Jan 28  | A1 review; Compiling R1 I                    | A1 Due (Monday) |
| Thu, Jan 30  | Compiling R1 II                              |                 |
| Tue, Feb 04  | Compiling R1 III                             |                 |
| Thu, Feb 06  | Register allocation I                        |                 |
| Tue, Feb 11  | A2 review; Register allocation II            | A2 Due (Monday) |
| Thu, Feb 13  | Register allocation III                      |                 |
| Tue, Feb 18  | Booleans & Typechecking                      | A3 Due (Monday) |
| Thu, Feb 20  | Compiling R2 I                               |                 |
| Tue, Feb 25  | A3 review; Compiling R2 II                   |                 |
| Thu, Feb 27  | REVIEW FOR MIDTERM                           |                 |
| Tue, Mar 03  | NO CLASS                                     | A4 Due (Monday) |
| Thu, Mar 05  | MIDTERM                                      |                 |
| Tue, Mar 10  | NO CLASS: Spring Break                       |                 |
| Thu, Mar 12  | NO CLASS: Spring Break                       |                 |
| Tue, Mar 17  | A4 review; Vectors & Garbage collection I    |                 |
| Thu, Mar 19  | Vectors & Garbage collection II              |                 |
| Tue, Mar 24  | Vectors & Garbage collection III             |                 |
| Thu, Mar 26  | Compiling Functions I                        |                 |
| Tue, Mar 31  | NO CLASS                                     | A5 Due (Monday) |
| Thu, Apr 02  | A5 review; Compiling Functions II            |                 |
| Tue, Apr 07  | A6 review; Compiling first-class functions I | A6 Due (Monday) |
| Thu, Apr 09  | Compiling first-class functions II           |                 |
| Tue, Apr 14  | A7 review; Dynamic typing                    | A7 Due (Monday) |
| Thu, Apr 16  | Objects & optimization                       |                 |
| Tue, Apr 21  | Binary & instruction sets                    |                 |
| Thu, Apr 23  | Review for final exam                        |                 |
| Tue, Apr 28  | Project presentations                        |                 |
| Thu, Apr 30  | Project presentations                        |                 |
| Thu, May 07  | FINAL EXAM (1:30pm, Votey 207)               |                 |


# Final Projects

## Project Ideas

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

## Schedule & Grading

The final project is worth 14% of your final grade. The schedule for final project deliverables, and the contribution of each one to the grade you receive for the final project, are as follows:

| Deliverable              | Due Date                     | Grade Percent | Turn In    |
| -----------------------: | -------------------          | ------------- | --------   |
| Project Proposal         | 4/6/20 at 11:59pm            | 10%           | Blackboard |
| Implementation & README  | 5/4/20 at 11:59pm            | 60%           | Blackboard |
| Project Presentations    | 4/28/20 and 4/30/20 in class | 30%           | In class   |


