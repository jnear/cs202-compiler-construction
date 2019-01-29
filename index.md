---
title: CS 295F: Compiler Construction
layout: default
---

# UVM CS295F: Compiler Construction (Spring 2019)

## Administrative

- **Lecture**: Tuesday and Thursday, 2:50pm - 4:05pm, Kalkin 325
- **Instructor**: Joe Near (jnear at uvm dot edu)
- **Office hours**: Fridays, 2:00pm - 4:00pm, Votey 317

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

- [Essentials of Compilation](https://www.dropbox.com/s/ktdw8j0adcc44r0/book.pdf?dl=1)  
  Jeremy G. Siek and Ryan R. Newton.

For questions about Racket, course material, or assignments, post to
Piazza. Feel free to answer others' questions, but please do not share
code or solutions. You can access Piazza here:

- [CS295F Piazza](piazza.com/uvm/spring2019/cs295f)

Other resources:

- Download the [Racket Distribution](https://download.racket-lang.org/)
- Code from lectures is [available on Github](https://github.com/jnear/cs295-compiler-construction/tree/master/lectures)

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


# Assignments

| Assignment | Topics Covered                    | Text Chapter  | Due Date         |
| ----------:| --------------------------------- | ------------- | ---------------- |
| 1          | [Interpreters & partial evaluation](https://github.com/jnear/cs295-compiler-construction/blob/master/homework/hw1.md) | Chapter 1 & 2 | Jan 28, 11:59pm  |
| 2          | Compiling R_1 to x86              | Chapter 2     | Feb 11, 11:59pm  |
| 3          | Using the Stack                   | Chapter 2     | Feb 18, 11:59pm  |
| 4          | Register Allocation               | Chapter 3     | Mar 4,  11:59pm  |
| 5          | Booleans and Control Flow         | Chapter 4     | Mar 18, 11:59pm  |
| -          | Midterm Exam                      | 1 - 4         | Mar 7 (in class) |
| 6          | Tuples and Garbage Collection     | Chapter 5     | Apr 1,  11:59pm  |
| 7          | Compiling Functions               | Chapter 6     | Apr 15, 11:59pm  |
| 8          | Compiling First-Class Functions   | Chapter 7     | Apr 22, 11:59pm  |
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
| Tue, Feb 12 | Using the stack II                  | A3 Released  |
| Thu, Feb 14 | Register allocation I               |              |
| Tue, Feb 19 | Register allocation II              |              |
| Thu, Feb 21 | Booleans & Typechecking             | A4 Released  |
| Tue, Feb 26 | Compiling Booleans                  |              |
| Thu, Feb 28 | REVIEW FOR MIDTERM                  |              |
| Tue, Mar 05 | NO CLASS: Town Meeting Day          |              |
| Thu, Mar 07 | MIDTERM                             | A5 Released  |
| Tue, Mar 12 | NO CLASS: Spring Break              |              |
| Thu, Mar 14 | NO CLASS: Spring Break              |              |
| Tue, Mar 19 | Tuples & Garbage collection I       |              |
| Thu, Mar 21 | Tuples & Garbage collection II      | A6 Released  |
| Tue, Mar 26 | NO CLASS (TBD)                      |              |
| Thu, Mar 28 | NO CLASS (TBD)                      |              |
| Tue, Apr 02 | Compiling Functions I               | A7 Released  |
| Thu, Apr 04 | Compiling Functions II              |              |
| Tue, Apr 09 | First-class functions               |              |
| Thu, Apr 11 | Compiling first-class functions I   | A8 Released  |
| Tue, Apr 16 | Compiling first-class functions II  |              |
| Thu, Apr 18 | Compiling first-class functions III |              |
| Tue, Apr 23 | Dynamically-typed languages         |              |
| Thu, Apr 25 | Objects                             |              |
| Tue, Apr 30 | Project Presentations I             |              |
| Thu, May 02 | Project Presentations II            |              |
| Thu, May 09 | FINAL EXAM (1:30pm, Kalkin 325)     |              |
