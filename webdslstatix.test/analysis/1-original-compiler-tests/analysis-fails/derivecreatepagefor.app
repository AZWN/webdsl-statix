// property "dinges" is a derived property and hence cannot be edited

application com.example.derive

description {
  This is an automatically generated description
}

section templates

  define main() {
    block("top") {
      top() }
    block("body") {
      block("left_innerbody") {
        sidebar() }
      block("main_innerbody") {
        body() } }
  }
  
  define top() {
    block("header") { }
  }
  
  define sidebar() { }

  define body() { }

section data model

  entity NewsItem {
    name :: String
    text :: Text
    comment :: Text
    dinges :: String := "Dinges" 
  }

section pages

  define page root() {
    table {
      row { navigate(createNewsItem()){"Create news item"} }
    }
  }

section test pages

  define page createNewsItem() {
    var item : NewsItem := NewsItem{}
    derive createPage from item for (name, text, dinges)
  }
