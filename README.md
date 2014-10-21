[![Build Status](https://travis-ci.org/carojane/drpulver.svg?branch=master)](https://travis-ci.org/carojane/drpulver) [![Code Climate](https://codeclimate.com/github/carojane/drpulver.png)](https://codeclimate.com/github/carojane/drpulver) [![Coverage Status](https://coveralls.io/repos/carojane/drpulver/badge.png)](https://coveralls.io/r/carojane/drpulver)


DrPulver is course interface for a professor to share course information and post assignments. Students can then submit assignments and message with each other with Ribbits (a twitter like system).

The main page and course information pages are public, but a log in is neccessary to view assignments and messages.

Each student has a user page where her profile and ribbits are visible to other users. The student can also view a list of courses she is enrolled in, along with the assignments for each course.

The professor can easily create course and assignments and view all the current assignments as well as all of the submissions on a single page for easy review.

The course information, assignment, submission and student profile models all have a jQuery WYSIWYG input form that is output as html. This feature may have to be changed in the future as the vendor jQuery is a bit clunky and glitchy, but it offers greater features than a simple textarea.

The app has room for many more features and more models, allowing further hosting of course information. One upgrade to consider is document upload capacity for submissions. Email invitations and authorizations should also be included before launching a working version of this app, for better security.

The Ribbit feature can also be developped in the future, with "mentions" and "following" features, as well as the option for linking ribbits to specific courses for seperate flows.

Record keeping functions along with submission review and grading features for the professor also offer future upgrade opportunities.
