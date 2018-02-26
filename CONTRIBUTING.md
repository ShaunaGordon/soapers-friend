# Contributing

This isn't really intended to be contributed to, but I won't dismiss good-faith contributions outright, either. Since I'm only one person, it'd make my life easier if you could follow some guidelines.

## Code Of Conduct

Simply put -- don't be a jerk. Don't go berating me (or others), because you're frustrated over a bug. Doing that will get your ticket closed without fixing or attribution.

Issues and PRs will be and are to be judged on the merit of their own content. I care about the code and what you can bring to that. That said, if you feel you're being wrongly judged, feel free to message me privately with your concerns and (if it's me) I can clarify my position on the thing (or apologize), or (if it's someone else) I can look into the matter and take appropriate action.

What that action will be will depend on the severity of the situation, but will generally start with a warning and can escalate to booting the person from the project.

## Issues

Something not working as expected, or know of a feature that'd be cool to add, but you don't have the requisite knowledge to open a pull request? The better you can describe it, the more likely I'll be able to incorporate it.

Here's some good things for me to know:

1. Bugs
  * Steps to reproduce. The more detailed, the better. Things like whether you're logged in, or what units you're using, or even whether you went and made coffee between steps may seem insignificant to you, but may make all the difference for me.
  * Expected outcome. "It should work" isn't sufficient, sorry. How should it work? Should it return a certain number? Should it go to a different page? Again, the more detail, the better. What are your expectations at this point in the task? (I can surmise how _I_ think it should work -- I did write it, after all -- but it's possible that I've done something to set up the wrong expectations, so providing me with what _you_ expect it to do helps me to determine the root cause of the issue you're experiencing.)
  * Actual outcome. Like the expected outcome, "it doesn't work" isn't helpful for me. I might be able to make it error, but could be getting a different error message than you. When in doubt, attach a screenshot (and if the UI is otherwise functional, don't be afraid to edit the screenshot to point out the issue you're seeing).
2. Features
  * Description of feature in as much detail as you have. Feel free for this to be a pipe dream type of feature. I <3 pipe dreams!
  * What "business issue" it solves. Bonus points for ideas for future growth stemming from the immediate feature request. (ie - "Adding a feature to track raw materials inventory automatically from batch inputs allows users to see current material levels and can allow for future creation of low-stock notifications.")

## Pull Requests

Fixed a bug or added a feature for me! Yay! Thank you! Before I can merge it, there are some things that would really help me keep this running smoothly.

1. Code should have test coverage, especially business logic. If it manipulates data, it should have tests to show that it does what you're claiming it does. If it's a new module, it should have tests to illustrate how to use it and ideally, what happens if used incorrectly (at least in the common cases).
2. Link to an existing issue (if there is one). If there's not an existing issue, a description of the issue being solved, per above Issue guidelines.
