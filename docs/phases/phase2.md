# Phase 2: Viewing Blogs and Posts
IN PROGRESS
## Rails
### Models

### Controllers
Api::CategorysController (show)
Api::ProjectsController (create, destroy, show, update)

### Views
* categorys/show.json.jbuilder

## Backbone
### Models
* Category 
* Project 

### Collections
* Categories 
* Projects 

### Views
* CategoryShow (composite view, contains ProjectsIndex subview)
* ProjectsIndex (composite view, contains ProjectsIndexItem subviews)
* ProjectsIndexItem
* ProjectShow

## Gems/Libraries
