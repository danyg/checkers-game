checkers-game
=============
This repo is intended to be a Proof of Concept, of the ideas propoused by [Nir Kaufman](https://twitter.com/nirkaufman) in this [ReactNYC conference](https://www.youtube.com/watch?v=JUuic7mEs-s) based on design principles of large scale messaging-based systems. Also adding some of my own sauce, taking in account my experience working on a high performance team, Business necessities on continuous integration systems (high refactor demanding systems). The idea is to find an Architecture that can scale easily, for rapid development and keeping at its core the business language and features as main actor of it.

It's often seen in many application's architecture that developers talks about data structures, repositories, components, styles and other kind of abstract partitions of the problem to solve, but rarely it's spoken about features, the part of the business logic the system is performing. Then after some months gets complicated to introduce new features, or refactor the current ones, as is not intuitive to find such feature in the system, and developers tend to forget how something was done or how name were given.

In order to achieve this goal the ideas proposed by Nir Kaufman are crucial as following the patterns defined by Nir, is easier to split the business logic in its own kingdom, and looks specially easier to divide the business logic in features, folders/directories that contains a bunch of collaborators, mappers,
enrichers, agregators, commands, etc... that are basically user stories
Also keeping the business logic separated in its own realm will be easier to create logicless "renderers" of such business logic decoupling completely the presentational layer from the logic one.

For this project I've chosen to use Typescript as in my vast experience using javascript in large projects, and where several people were involved, **Types are a must**, are crucial in the self documentation of the code, are critical to connect different layers of application and keep consistency among the different parts of the system and a team of collaborators. Also interfaces are pretty useful for this.

# How to use
- First `source ./_ autocomplete` to enable `./_` command autocomplete in your terminal
- `./_ help`
