---
title: CS 202: Compiler Construction
layout: default
---

# UVM CS202: Compiler Construction (Spring 2020)

## Announcements

None yet.

## Administrative

- **Lecture**: Monday & Wednesday, 2:50-4:05pm, Votey 207
- **Instructor**: Joe Near (jnear at uvm dot edu)
- **Office hours**: TBA, Innovation E458

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

- [Essentials of Compilation](https://github.com/jnear/cs295-compiler-construction/blob/master/book.pdf)  
  Jeremy G. Siek and Ryan R. Newton.

For questions about Haskell, course material, or assignments, post to
Piazza. Feel free to answer others' questions, but please do not share
code or solutions. You can access Piazza here:

- [CS202 Piazza](TBA)

Other resources:

- Set up Haskell Stack (TBA)
- Code from lectures is [available on Github](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures)
- The [midterm review sheet](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures/midterm-review.md) is available
- The [final review sheet](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures/final-review.md) is available

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

Assignments will generally be due weekly on Sundays at 11:59pm,
with breaks for the midterm exam and final project. Your assignment
will be graded using a test suite which will be made available one day
before the assignment due date.

Late assignments will **not** be accepted. Each assignment builds
extensively on the last one, and mastering the assignment material is
crucial to success in this course. If you fall behind on completing
the assignments, it will be extremely difficult to catch up.

Therefore, on Monday after each assignment due date, we will discuss
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

| Assignment  | Topics Covered                                                                                                          | Text Chapter  | Due Date          |
| ----------: | ---------------------------------                                                                                       | ------------- | ----------------  |
| 1           | [Compiling R0 to x86](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw1.md)                 | Chapter 1 & 2 | Feb 2, 11:59pm    |
| 2           | [Compiling R1 to x86](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw2.md)                 | Chapter 2     | Feb 9, 11:59pm    |
| 3           | [Register Allocation](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw4.md)                 | Chapter 3     | Feb 16,  11:59pm  |
| -           | Midterm Exam                                                                                                            | 1 - 4         | Feb 24 (in class) |
| 4           | [Booleans and Control Flow (R3)](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw5.md)      | Chapter 4     | Mar 15, 11:59pm   |
| 5           | [Vectors and Garbage Collection (R4)](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw6.md) | Chapter 5     | Mar 29, 11:59pm   |
| 6           | [Compiling Functions (R5)](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw7.md)            | Chapter 6     | Apr 5, 11:59pm    |
| 7           | [Compiling First-Class Functions (R6)](TBA)                                                                             | Chapter 7     | Apr 12, 11:59pm   |
|             | Final Project                                                                                                           |               | *See below*       |
| -           | Final Exam                                                                                                              | 5 - 7         | TBA               |

# Class Schedule

| Date         | Topic                                        | Assignment      |
| -----------: | -----------------------------------          | ------------    |
| Mon, Jan 13  | Welcome & Haskell                            |                 |
| Wed, Jan 15  | ASTs & Interpreters                          |                 |
| Mon, Jan 20  | NO CLASS                                     |                 |
| Wed, Jan 22  | x86 Assembly                                 |                 |
| Mon, Jan 27  | Compiling R0                                 |                 |
| Wed, Jan 29  | Compiling R1 I                               |                 |
| Mon, Feb 03  | A1 review; Compiling R1 II                   | A1 Due (Sunday) |
| Wed, Feb 05  | Compiling R1 III                             |                 |
| Mon, Feb 10  | A2 review; Register allocation I             | A2 Due (Sunday) |
| Wed, Feb 12  | Register allocation II                       |                 |
| Mon, Feb 17  | NO CLASS                                     | A3 Due (Sunday) |
| Wed, Feb 19  | A3 review; REVIEW FOR MIDTERM                |                 |
| Mon, Feb 24  | MIDTERM                                      |                 |
| Wed, Feb 26  | Booleans & Typechecking                      |                 |
| Mon, Mar 02  | Compiling R2 I                               |                 |
| Wed, Mar 04  | Compiling R2 II                              |                 |
| Mon, Mar 09  | NO CLASS: Spring Break                       |                 |
| Wed, Mar 11  | NO CLASS: Spring Break                       |                 |
| Mon, Mar 16  | A4 review; Vectors & Garbage collection I    | A4 Due (Sunday) |
| Wed, Mar 18  | Vectors & Garbage collection II              |                 |
| Mon, Mar 23  | Vectors & Garbage collection III             |                 |
| Wed, Mar 25  | Compiling Functions I                        |                 |
| Mon, Mar 30  | NO CLASS                                     | A5 Due (Sunday) |
| Wed, Apr 01  | A5 review; Compiling Functions II            |                 |
| Mon, Apr 06  | A6 review; Compiling first-class functions I | A6 Due (Sunday) |
| Wed, Apr 08  | Compiling first-class functions II           |                 |
| Mon, Apr 13  | A7 review; Dynamic typing                    | A7 Due (Sunday) |
| Wed, Apr 15  | Objects & optimization                       |                 |
| Mon, Apr 20  | Binary & instruction sets                    |                 |
| Wed, Apr 22  | Review for final exam                        |                 |
| Mon, Apr 27  | Project presentations                        |                 |
| Wed, Apr 29  | Project presentations                        |                 |
| TBA          | FINAL EXAM (TBA)                             |                 |

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
| Project Proposal         | 4/5/20 at 11:59pm            | 10%           | Blackboard |
| Implementation & README  | 5/3/20 at 11:59pm            | 60%           | Blackboard |
| Project Presentations    | 4/27/20 and 4/29/20 in class | 30%           | In class   |

