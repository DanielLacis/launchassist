# Launch Assist 

[Heroku link][heroku]

[heroku]: http://launchassist.io

## Minimum Viable Product
Launch Assist is a clone of Kickstarter built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Create projects 
- [ ] Describe project
- [ ] Set funding goal
- [ ] Set fundraising duration
- [ ] Comment on projects
- [ ] Back a project (provide funding)
- [ ] View project backers
- [ ] Search for project by category
- [ ] Search for project by name
- [ ] Have multiple project categories

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Category and Project Creation (~1 day)
User authentication will be implemented with email, password digest, and session
tokens.  Backend will also be created for categories and projects in Rails.
Since the projects will be displayed by category by default, both of these need
to be implemented.

[Details][phase-one]

### Phase 2: Categories and Projects (~2 days)
Add API routes to provide JSON, then add models and collections for the project
categories and projects.  Users will be able to create and view projects in a
single page backbone app implementing composite views and preventing zombie
views.  Will also include editing projects.  Users will not be able to create or
edit categories.

[Details][phase-two]

### Phase 3: Projects get markdown and image support (~2 days)
Addition of markdown and image support for projects.  Will use some form of
third party libraries and Amazon Web Services.

[Details][phase-three]

### Phase 4: Backing projects and backer list (~2 days)
Users will be able to back a project and view backers.  Backing is done at
pre-determined amounts set by the project creator.  Backers are displayed by the
tier that they backed the project at.

[Details][phase-four]

### Phase 5: Comments (~1 day)
Users will be able to post comments regarding a project.  Comments will be
displayed chronologically.

[Details][phase-five]

### Phase 6: Searching for Projects (~2 days)
Implement project searching, displaying the projects as the search terms are
typed in.  Typeahead is desired but not mandatory.

[Details][phase-six]

### Bonus Features ()
- [ ] Pagination/infinite scroll
- [ ] Multiple sessions/session management (computer, phone, tablet seperate
  sessions)
- [ ] User avatars
- [ ] Typeahead search bar
- [ ] Stretch goals
- [ ] Ask project creator questions
- [ ] Voting on questions to be answered
- [ ] display questions

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
