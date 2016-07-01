# Getting Started with dpSlate

dpSlate can be used either stand alone on a PC or can be used to automatically publish documents to your portal if it is powered by dpEngine.  

## Installing and Using dpSlate in Stand Alone Mode  

> What Version of Ruby is Installed?

```md
$ ruby -v

ruby 2.0.0p247 (2013-06-27 revision 41674)

```

> Install the Dependencies

```md
$ cd dpSlate
$ bundle install
```

> Start Your Test Server

```md
$ bundle exec middleman server
== The Middleman is loading
== The Middleman is standing watch at http://0.0.0.0:4567
== Inspect your site configuration at http://0.0.0.0:4567/__middleman/

```

 1. Login to Github and fork this repository on Github (https://github.com/pnerger/dpSlate)
 2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/{YOURUSERNAME}/dpSlate.git`
 3. `cd dpSlate`
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`
 
 ___OR___

 1. Login to Github and download the dpSlate Zip file (https://github.com/pnerger/dpSlate)
 2. unzip the zip file into the directory that you want to work in.
 3. cd to that directory.
 4. Install all dependencies: `bundle install`
 5. Start the test server: `bundle exec middleman server`

You can now see the docs using your browser at <http://localhost:4567>. And as you edit and save your `source/index.md`, your server should automatically update! Whoa! That was fast!

## Using dpSlate with dpEngine

> dpSlate directory structure in Bitbucket

```
\dpslate
	\source
		\site
			\xyz
				\abc
					index.md			
		\images
			\xyz
				\abc
					image1.png
					image2.jpeg
	\build
		\site
			\xyz
				\abc
					index.html
		\images
			\xyz
				\abc
					image1.png
					image2.jpeg
\site
	\xyz
		\abc
			index.gsp

```

If you have a portal that is powered by dpEngine, there is nothing to install for dpSlate works automatically with dpEngine.  

When you use dpEngine, your web portal content is stored in a version of Git called Bitbucket.  You will be provided with access to Bitbucket for your portal's repository.  Your portal will contain a number of folders that in turn contain the documents that will be published to your portal. 

When you create a GFM markdown file in \dpslate\site\source the markdown will automatically be converted into dpSlate HTML and placed in the shadow directory in the \dpslate\site\build folder.  Additionally, a shadow directory will be created in \site that will contain a `.gsp` file that is used by dpEngine to place headers and foooters into the document and to control access to the web page.

The images that you include into your dpSlate markdown document will be stored in the \dpslate\source\images directory.  Once they are here, they will be automatically managed by dpSlate and dpEngine.  We recommend that you also use the additional directory structure for images as you do with your source file to help you better manage your images.

As mentioned earlier, when you use dpEngine, there is no need to install dpSlate, it is part of your dpEngine environment. 

### Editing a dpSlate/dpEngine Document  

There are two ways to edit the Markdown for a dpSlate document hosted in dpEngine; you can either edit it locally using Git or you can edit it inside Bitbucket using a web browser.

When you edit the document locally, you will need to find the document markdown source in the \dpslate\source folder tree in your local Git repository.  After you are done with the edit, you will commit and push the document to your dpEngine stage branch.  Your Bitbucket server will automatically build the HTML instance of the document and it will be accessible in the staging environment for your portal.  You can use any of hundreds of different markdown editors to edit your dpSlate source documents.

The second method is to view the document using your browser in the staging environment.  If you are an authorized _Author_ or _Editor_ for the document, you will see the following buttons on the document:

* _Edit_ - allows you to change the document.  When you press the `edit` button, a Markdown editor will open in your browser with the corresponding dpSlate document loaded.  You simply change your markdown file and when you save it, your document will be converted and your browser will display the recently edited document.
* _Images_ - allows you to manage the images in the dpslate image folder for use within your markdown document.  You can upload or delete images.
* _Publish_ - allows you to publish your new document to your production environment.  The _Publish_ button is only available to those with the _Editor_ role.


# How dpSlate Works

dpSlate generates HTML documents from Github Flavored Markdown (GFM), a particular dialect of Markdown.  dpSlate software is written in Ruby and takes advantage of some popular Ruby software including Middleman, RedCarpet, and Rouge.  The dpSlate software reads a .md (markdown) source-file and will output a .html file along with the accompanying Javascript and CSS files.

To get a consistent look and feel to your web documentation, you will want your  authors to use the GFM tags in a particular to we get a common and consistent look and feel.

## Structure of a dpSlate Document

As you look at this document, you will notice that there are a couple of feature.  First, to the left is the Table of Contents area.  Next, in the center is the Body of the document, and to the Right (in the dark area) are code examples.  Each of these elements have the following characteristics:

### Table of Contents

The TOC panel on the left hand side of the panel is composed of the following elements starting at the top and moving to the bottom:

* _Title Page_ - At the very top, is the title of the document.  If you've enabled the Title Page function, then an _about_ link will be created and when clicked it will open up a title page and provide more information about the document.
* _Search Box_ - If search is enabled, a Search Box will appear above the Table of Contents.  The Search Box is used to search the document looking for phrases of interest.  The phrases are then highlighted in the Table of Contents.
* _The Table of Contents_ - The Table of Contents are automatically built if the feature has been turned on.  By default, on the H1 is normally displayed.  If a user selects a H1 item, the TOC will expand to display the H2 items underneath it.  If the user selects a H2 item, the TOC will expand to display the H3 items underneath it.  Directives are used to control the table of contents.
* _The TOC Footer_ - you can use this to store information at the bottom of the table of contents.

### Document Body

The body of the document is found in the center panel and contains the main textual description of the API.  It uses a number of different elements and features to communicate what the API actually does and these include:

* Headers - these are titles of document section of which the H1 and H2 will automatically appear in the TOC
* Paragraphs - these are simple paragraphs of text
* Bold Text
* Italicized Text
* Inline Code Text
* Tables
* Bullet Lists
* Number Lists
* Hints - These are Green Highlighted Text
* Warnings - These are Red Highlighted Text
* Notes - These are Blue Highlighted Text
* Links - HTML hyperlinks to external documents

### Code Samples

The key part of the dpSlate format for API documentation is that code samples can be viewed alongside of the API call that they illustrate.  Further sample code can be held simultaneously in several different programming languages (important for SOAP and REST API's).  Because programmers tend to only work in a single language at a time, the dpSlate format accommodates this by having the programming language as a tab on the far right panel.  Thus, the developer is able to choose a programming language and then use the documentation in that language without being distracted by any other language.

Sample code is anchored to either the H1 or H2 heading that they are inserted under; that is, they are placed under the Heading and will move up or down with the main text body. Code samples have the following elements that are used to control their placement:

* Language - there is a tab for each language that is supported and specified in the header.  
* Code Annotations - these are highlighted areas that are not code but used to point out a code section.
* Shared Code Samples - it is possible to make code that appears in all of the tabs.

<aside class="notice">
The default behavior is to place code samples into a dedicated right-hand panel.  However, you can also turn off the right-hand panel and the code samples will appear inline with the text in the main panel of the document.
</aside>
  
# Specifying Your Document Directives

> Directives for this Document

```markdown
---
title: "Authoring Documents dpSlate"

version: "V4.0" 

copyright: "Copyright &copy; 2013-2015 Perigee Capital, LLC., Portions Copyright 2008-2013 by Concur Technologies, Inc. All Rights Reserved."

publisher: "DeveloperProgram.com"

publisher_address: "Perigee Capital LLC., 2300 Greenhill Drive, Suite 400, Round Rock, TX 78664, USA"

comments: "dpSlate is Licensed under the Apache License, Version 2.0 (the License); you may not use this file except in compliance with the License. You may obtain a copy of the License on the site http://www.apache.org at /licenses/LICENSE-2.0.  Unless required by applicable law or agreed to in writing, the dpSlate software distributed under the License is distributed on an AS IS BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  The Perigee Capital, DevelopProgram.com, DP.com, dpSlate, and the dp.com Logo are trademarks of Perigee Capital, LLC."

titlePage: ON

tableOfContents: ON

tocAccordian: OFF

rightPanel: ON

leftPanel: ON

documentSearch: ON

language_tabs:
  - shell: Sample
  - python: Python
  - ruby: Ruby
  
toc_selectors: "h1,h2,h3"
  
toc_footers:
  - That's all folks!

---
```
A GitHub Flavored Markdown (GFM) source document is used to generate each of the dpSlate Documents that are presented on the portal.  Each dpSlate GFM source document is a plain text document that starts with a Yet Another Markup Language (YAML) header that contains directives used to control how the document will be formatted.  The YAML header starts and ends with a line that has three dashes, `---`, that start in the first column of the line.

The YAML header contains directives that control how the document will look and appear when it is converted to HTML.  The directives consist of a YAML variable name, the directive, followed by a `:`.  There are three types of YAML variables:

* _Boolean_ - booleans variables are used to turn things on or off using various keywords to represent true or false.  YAML is flexible and the values for true and false are anything that kinda looks like a true or false.  For example true can be represented by `T, TRUE, Y, Yes, or ON` independent of case while the values for false are similar and can be represented by `F, FALSE, N, NO, or OFF` regardless of case.

* _String_ - a string is either a string of text or quoted text.  Text can be quoted either by a double, `"`, or single, `'`, quotation mark.  Boolean keywords that are not in quotes might be interpreted as a boolean directive.

* _List_ -  a list is a collection of items.  The items in the list are strings that are also know as a “hash” or a “dictionary”.  Directives that are lists consist of the directive followed by a number of lines that are indented and start with a dash, `-`, followed by a space. 


The valid dpSlate YAML document directives include:

## Document Panels

A dpSlate document is made up of up to three panels which are turned on or off with the following directives:

* `leftPanel:` is a boolean directive that is used to turn on the left hand panel.  When turned on, the left hand panel will contain the title page, the document search box, the table of contents, and the ToC footer if each of them are turned on.  If the leftPanel is turned off, then the items that should be included in the leftPanel are placed at the top of the center panel.

<aside class="notice">
When the Left Hand Panel is turned off, the Right Hand Panel will also be turned off at the same time and the rightPanel directive will be ignored.
</aside>

* `rightPanel:` is a boolean directive that is used to turn on the right hand panel.  When turned on, the right hand panel contains tabs for each programming language that has sample code associated with it.  When the right hand panel is turned off, the code samples are inserted in-line in the center panel.

The Center Panel is always on and cannot be turned on or off.

## Title Page

There are a number of variables that are used for display in the title page of the document.  The Title Page is displayed at the very top of the document is the text "About this Document" which is a link.  When the link is selected, the Title Page will open up and display information about the document from the variables in the header including:

* `titlePage:` is a boolean that when set to true will turn on the Title Page feature. 
* `title:` text string that contains the name of the document.  It is used for both in the Title Page and the &lt;title&gt; tag in the header of the resulting HTML page.
* `version:` a text string used to display the current version of the document in both the Title Page and the TOC Footer (if both are turned on).
* `copyright:` a text string that contains the copyright statement for the document.  Copyright statements should contain the word "Copyright", followed by the copyright symbol of &copy;, followed by the years that the work was first created and the year that it was last modified, and finished off with the phrase "All Rights Reserved."
* `publisher:` a text string that contains the name of the document publisher.
* `publisher_address:` a text string that contains the address of the publisher.
* `comments:`  a free text string that allows the author to put in information about the document that will help the reader understand the context.

In addition to these values that are set for the Title Page, the date that the document was "built" is displayed at the bottom of the "Title Page" as the "Published Date".

## Turning on Language Tabs

The _language_tab_ directive is used to create the programming language tabs that make up the right hand panel of a dpSlate document.  The _language_tab_ directive is a list and thus the _language_tab_ statement is followed by one or more lines containing a statement that contains two blank spaces, a dash, the name of the language for use in encoding the document, an option ":", followed by an optional display name for the language.

The name of the language must be recognized by the system such that the display engine will automatically perform syntax highlighting on the code.  The engine supports lots of different languages but the most common values used are:

* c++:C++
* c#:C#
* css:CSS
* html:HTML
* json:JSON
* java:Java
* javascript:JavaScript
* markdown:GFM
* objective-c:Objective-C
* perl:Perl
* php: PHP
* puppet:Puppet
* python:Python
* ruby:Ruby
* shell
* xml:XML
* yaml:YAML

<aside class="notice">
Only list the languages that you want to have as tabs in your document.  Each time you list a language as a _language_tab_, dpSlate will automatically create the language tab regardless if that language is used in the document.
</aside>

# The Left Hand Panel

When turned on, the far left panel of a dpSlate document contains the title page, the document search box, and the Table of Contents.  The title page is generated from the directives already discussed, the ToC is automatically generated from the Headers found in your GFM source document but it is controlled by the values you set for directives in the headers of your documents.

## ToC Directives

There are a number of directives for controlling how the Table of Contents is presented.  These are:

* `documentSearch:` a boolean used to turn the document search feature on and off.
* `toc_selectors:` this string is a comma list of the document elements that will be selected for inclusion into the table of contents.  If the statement is missing, then the default value is "h1, h2, h3" which means that Headers 1, 2, and 3 will be included into the Table of Contents.  If you were to choose "h2, h3, h4, h5" then the first level headers would be ignored and only the second, third, fourth, and fifth levels will be selected for inclusion into the Table of Contents.
* `toc_footers:` this list will be used to create a bullet list of text that will appear at the bottom of the table of contents.  The footer statement is used to place text and links at the bottom of the Table of Contents.  In addition to the values that you specify, the version number (see the version directive above) will be included, followed by the values that you provide, and finally the date that the document was built.

<aside class="notice">
Document Search is dpSlate's way of providing a full text index for readers.  When you turn on document search in your document, a search box will appear above the  Table of Contents. When the reader types in text into the search box, the Table of Contents will be removed and text in the document that matches the search term will be highlighted with a yellow background.  A _next_ and _prev_ button will be provided to allow the reader to jump to the next and previous hit on the search term.
</aside>

# Creating the Body of a dpSlate Document

## Creating Headers

Headers are created by using one or more # characters starting in the first line of text within the GFM document. The sample to the right shows GFM that will result in a level 1, level 2, and level 3 headers.  Only the level 1 and level 2 headers will appear in the Table of Contents.  When you create sample code, it will anchor to a header.

On the right are a list of headers in markdown and below is how they will appear in the document:
######

> Headings - Only H1 and H2 are shown in the TOC

```markdown

# H1 Header
## H2 Header
### H3 Header
#### H4 Header
#### H5 Header
#### H6 Header

```
# H1 Header
## H2 Header
### H3 Header
#### H4 Header
#### H5 Header
#### H6 Header

<aside class="notice">
Remember that only level 1, 2, and 3 headers will appear in the Table of Contents by default and that this you can change this using the "toc_selector" directive.
</aside>

## Creating a Paragraphs

For normal text, just type your paragraph on a single line.

    This is some paragraph text. Exciting, no?

Make sure the lines above below your paragraph are empty.

## Creating Formatted Text

> Formatting Text in GFM

```markdown
    This text is **bold**, this is *italic*, and this is an

    `
    Inline code block in the main section.
    `
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.
```

    This text is **bold**, this is *italic*, and this is an

    `Inline code block in the main section.`
    
    You can also use underscores to create __bold__ or _italic_.
    
    Finally, you can combine ***bold and italic***.

<aside class="success">
You can use those formatting rules in code annotations, tables, paragraphs, lists, wherever.
</aside>

## Strikethrough

```markdown

Strikethrough allows you to show text that is ~~no longer relevant by using strikethrough~~


```

You can format text with a strikethrough by enclosing the text in double tildes, `~~`.  The example to the right becomes:

Strikethrough allows you to show text that is ~~no longer relevant by using strikethrough~~


## Creating Markdown Links

> The Three Ways to Create GFM Links

```markdown
Here's an inline link to [Google](http://www.google.com/).
Here's a reference-style link to [Google][1].
Here's a very readable link to [Yahoo!][yahoo].

  [1]: http://www.google.com/
  [yahoo]: http://www.yahoo.com/
```

There are three ways to write links in GFM. Each is easier to read than the last.  The code to the right will generate the following:

Here's an inline link to [Google](http://www.google.com/).
Here's a reference-style link to [Google][1].
Here's a very readable link to [Yahoo!][yahoo].

  [1]: http://www.google.com/
  [yahoo]: http://www.yahoo.com/
  
The link definitions can appear anywhere in the document -- before or after the place where you use them. The link definition names [1] and [yahoo] can be any unique string, and are case-insensitive; [yahoo] is the same as [YAHOO].

## Using HTML Standard Links

> Using HTML Links in GRM

```html
<a href="http://www.developerprogram.com" title="DP.com">DeveloperProgram.com Web Site</a>
```

You can also use standard HTML hyperlink syntax.  The HTML example to the right produces the text below:

<a href="http://www.developerprogram.com" title="DP.com">DeveloperProgram.com Web Site</a>


## Inserting an Image

> GFM for Inserting an Image Stored Locally

```markdown
![DP Logo](/images/logo.png).
```

![DP Logo](/images/logo.png).

The Markdown to the right shows how an image can be inserted, in this case, it is the DP Logo that is right above this.  The text inside the square brackets, `[DP Logo]` will become the alt text for the image in the HTML `alt=` parameter.

<aside class="success">
Images essentially look just like a link except that they start with a '!' .
</aside>

<aside class="notice">
Notice that this image is coming from the local image folder.  We recommend that you place your images inside the image folder within your source directory.
</aside>

## Inserting Horizontal Rules

Sometimes you just need a Horizontal Rule (line) to convey something.  GFM does this with either three or more consecutive Hyphens `-`, Asterisks `*`, or Underscores `_`.


```markdown
Three or more...

---

Hyphens

***

Asterisks

___

Underscores
```
Three or more...

---

Hyphens

***

Asterisks

___

Underscores

## Using HTML in Markdown

```markdown
<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>
```
You can also use raw HTML in your Markdown, and it'll mostly work pretty well.

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

<aside class="warning">
Just because you can, doesn't mean that you should.  One of the features of Markdown is that you don't have to worry about the formatting details of HTML.  Also, it provides
a separation of content and format which you loose when you start placing HTML into your Markdown.
</aside>

## Creating a Table

> GFM for Creating a Table

```markdown
Table Header 1 | Table Header 2 | Table Header 3
-------------- | -------------: | :------------:
Row 1 col 1 | Row 1 col 2 | Row 1 col 3
Row 2 col 1 | Row 2 col 2 | Row 2 col 3
```

Slate uses PHP Markdown Extra style tables.  The example to the right will create the table below.


Table Header 1 | Table Header 2 | Table Header 3
-------------- | -------------: | :------------:
Row 1 col 1 | Row 1 col 2 | Row 1 col 3
Row 2 col 1 | Row 2 col 2 | Row 2 col 3

Notice the colons in the line underneath the header line.  These are used align that columns of the table. A no colon or only a colon to the left will cause the column to align to the left.  A colon to the right will cause the column to align right.  And a colon to the left and the right will cause the column to center.

<aside class="notice"> Note that the pipes do not need to line up with each other on each line.</aside>

<aside class="success"> If you don't like that syntax, feel free to use normal html \<table\>`s directly in your markdown.</aside>


## Creating Numbered Lists

> GFM for Numbered Lists

```markdown
1. This
2. Is
  3. Nested
  6. Number
  1. List
3. An
8. Ordered
9. List
```

Numbered lists are created using the GFM markdown code to the right.  You can create nested lists, but the bullets are indented by two spaces.  The sample code to the right will create the list below:

1. This
2. Is
  3. Nested
  6. Number
  1. List
3. An
8. Ordered
9. List

<aside class="notice"> Notice that the order of the numbers do not make a difference.  It is just that a number is used that makes an ordered list. </aside>

<aside class="notice"> Note that by indenting by two characters, you are creating an indented list and the numbering restarts and when you go back, the numbering resumes.</aside>

## Creating Bulleted Lists

> GFM for created bullet lists

```markdown
- This
+ Is
  * nested
  - bullet
* A
* Bullet
* List
```

Numbered lists are created using the GFM markdown code to the right.  you can create nested lists, but the bullets are indented by two spaces.  The sample code
to the right will create the list below:

- This
+ Is
* A
  * nested
  - bullet
* Bullet
* List


<aside class="notice"> Notice that bullet lists can be created using a -, a +, or an \*. </aside>

<aside class="notice"> Note that by indenting by two characters, you are creating an indented list.</aside>

## Creating Special Notes and Warnings

> Sample for creating Notes and Warnings

```markdown

<aside class="notice"> This is a sample note. </aside>
    
<aside class="warning"> This is a sample warning.</aside>

<aside class="success"> This is a sample hint.</aside>

```

You can add warnings and notes with just a little HTML embedded in your markdown document.  To the right, are three different examples of highlights using html.  Below you will see how each of the three examples will manifest themselves in the final document.

<aside class="notice"> This is a sample note. </aside>
    
<aside class="warning"> This is a sample warning.</aside>

<aside class="success"> This is a sample hint.</aside>

Use the `class="notice"` for blue notes, `class="warning"` for red warnings, and `class="success"` for green notes.

# Sample Code

> Sample GFM to Denote Sample Code

```markdown
    ```python
    // this is some python code
    ```
    ```ruby
    # this is some ruby code
    ```
```

Code samples are an important way of communicating how to use an API.  dpSlate does an excellent job of handling code samples in multiple languages simultaneously through the use of the tabbed sample code panel on the right hand side.

## Inserting Large Code Samples

> Large Python Program

```python
import collections
import itertools
import re
import sys
import warnings
from bs4.dammit import EntitySubstitution
try:
    next
except NameError:
    from bs4._compatibility import next_function as next


DEFAULT_OUTPUT_ENCODING = "utf-8"
PY3K = (sys.version_info[0] > 2)

whitespace_re = re.compile("\s+")

def _alias(attr):
    """Alias one attribute name to another for backward compatibility"""
    def _get_alias(self):
        return getattr(self, attr)

    def _set_alias(self):
        return setattr(self, attr)

    alias = property(_get_alias, _set_alias)
    return alias


class NamespacedAttribute(unicode):

    def __new__(cls, prefix, name, namespace=None):
        if name is None:
            obj = unicode.__new__(cls, prefix)
        else:
            obj = unicode.__new__(cls, prefix + ":" + name)
        obj.prefix = prefix
        obj.name = name
        obj.namespace = namespace
        return obj


class PageElement(object):
    """Contains the navigational information for some part of the page
    (either a tag or a piece of text)"""

    # There are five possible values for the "formatter" argument passed in
    # to methods like encode() and prettify():
    #
    # "html" - All Unicode characters with corresponding HTML entities
    #   are converted to those entities on output.
    # "minimal" - Bare ampersands and angle brackets are converted to
    #   XML entities: &amp; &lt; &gt;
    # None - The null formatter. Unicode characters are never
    #   converted to entities.  This is not recommended, but it's
    #   faster than "minimal".
    # A function - This function will be called on every string that
    #  needs to undergo entity substition
    FORMATTERS = {
        "html" : EntitySubstitution.substitute_html,
        "minimal" : EntitySubstitution.substitute_xml,
        None : None
        }

    def setup(self, parent=None, previous_element=None):
        """Sets up the initial relations between this element and
        other elements."""
        self.parent = parent
        self.previous_element = previous_element
        self.next_element = None
        self.previous_sibling = None
        self.next_sibling = None
        if self.parent is not None and self.parent.contents:
            self.previous_sibling = self.parent.contents[-1]
            self.previous_sibling.next_sibling = self

    nextSibling = _alias("next_sibling")  # BS3
    previousSibling = _alias("previous_sibling")  # BS3

    def replace_with(self, replace_with):
        if replace_with is self:
            return
        if replace_with is self.parent:
            raise ValueError("Cannot replace a Tag with its parent.")
        old_parent = self.parent
        my_index = self.parent.index(self)
        if (hasattr(replace_with, 'parent')
            and replace_with.parent is self.parent):
            # We're replacing this element with one of its siblings.
            if self.parent.index(replace_with) < my_index:
                # Furthermore, it comes before this element. That
                # means that when we extract it, the index of this
                # element will change.
                my_index -= 1
        self.extract()
        old_parent.insert(my_index, replace_with)
        return self
    replaceWith = replace_with  # BS3

    def replace_with_children(self):
        my_parent = self.parent
        my_index = self.parent.index(self)
        self.extract()
        for child in reversed(self.contents[:]):
            my_parent.insert(my_index, child)
        return self
    replaceWithChildren = replace_with_children  # BS3

    def extract(self):
        """Destructively rips this element out of the tree."""
        if self.parent is not None:
            del self.parent.contents[self.parent.index(self)]

        #Find the two elements that would be next to each other if
        #this element (and any children) hadn't been parsed. Connect
        #the two.
        last_child = self._last_descendant()
        next_element = last_child.next_element

        if self.previous_element is not None:
            self.previous_element.next_element = next_element
        if next_element is not None:
            next_element.previous_element = self.previous_element
        self.previous_element = None
        last_child.next_element = None

        self.parent = None
        if self.previous_sibling is not None:
            self.previous_sibling.next_sibling = self.next_sibling
        if self.next_sibling is not None:
            self.next_sibling.previous_sibling = self.previous_sibling
        self.previous_sibling = self.next_sibling = None
        return self

    def _last_descendant(self):
        "Finds the last element beneath this object to be parsed."
        last_child = self
        while hasattr(last_child, 'contents') and last_child.contents:
            last_child = last_child.contents[-1]
        return last_child
    # BS3: Not part of the API!
    _lastRecursiveChild = _last_descendant

    def insert(self, position, new_child):
        if new_child is self:
            raise ValueError("Cannot insert a tag into itself.")
        if (isinstance(new_child, basestring)
            and not isinstance(new_child, NavigableString)):
            new_child = NavigableString(new_child)

        position = min(position, len(self.contents))
        if hasattr(new_child, 'parent') and new_child.parent is not None:
            # We're 'inserting' an element that's already one
            # of this object's children.
            if new_child.parent is self:
                if self.index(new_child) > position:
                    # Furthermore we're moving it further down the
                    # list of this object's children. That means that
                    # when we extract this element, our target index
                    # will jump down one.
                    position -= 1
            new_child.extract()

        new_child.parent = self
        previous_child = None
        if position == 0:
            new_child.previous_sibling = None
            new_child.previous_element = self
        else:
            previous_child = self.contents[position - 1]
            new_child.previous_sibling = previous_child
            new_child.previous_sibling.next_sibling = new_child
            new_child.previous_element = previous_child._last_descendant()
        if new_child.previous_element is not None:
            new_child.previous_element.next_element = new_child

        new_childs_last_element = new_child._last_descendant()

        if position >= len(self.contents):
            new_child.next_sibling = None

            parent = self
            parents_next_sibling = None
            while parents_next_sibling is None and parent is not None:
                parents_next_sibling = parent.next_sibling
                parent = parent.parent
                if parents_next_sibling is not None:
                    # We found the element that comes next in the document.
                    break
            if parents_next_sibling is not None:
                new_childs_last_element.next_element = parents_next_sibling
            else:
                # The last element of this tag is the last element in
                # the document.
                new_childs_last_element.next_element = None
        else:
            next_child = self.contents[position]
            new_child.next_sibling = next_child
            if new_child.next_sibling is not None:
                new_child.next_sibling.previous_sibling = new_child
            new_childs_last_element.next_element = next_child

        if new_childs_last_element.next_element is not None:
            new_childs_last_element.next_element.previous_element = new_childs_last_element
        self.contents.insert(position, new_child)

    def append(self, tag):
        """Appends the given tag to the contents of this tag."""
        self.insert(len(self.contents), tag)

    def insert_before(self, predecessor):
        """Makes the given element the immediate predecessor of this one.

        The two elements will have the same parent, and the given element
        will be immediately before this one.
        """
        if self is predecessor:
            raise ValueError("Can't insert an element before itself.")
        parent = self.parent
        if parent is None:
            raise ValueError(
                "Element has no parent, so 'before' has no meaning.")
        # Extract first so that the index won't be screwed up if they
        # are siblings.
        if isinstance(predecessor, PageElement):
            predecessor.extract()
        index = parent.index(self)
        parent.insert(index, predecessor)

    def insert_after(self, successor):
        """Makes the given element the immediate successor of this one.

        The two elements will have the same parent, and the given element
        will be immediately after this one.
        """
        if self is successor:
            raise ValueError("Can't insert an element after itself.")
        parent = self.parent
        if parent is None:
            raise ValueError(
                "Element has no parent, so 'after' has no meaning.")
        # Extract first so that the index won't be screwed up if they
        # are siblings.
        if isinstance(successor, PageElement):
            successor.extract()
        index = parent.index(self)
        parent.insert(index+1, successor)


```

Sometimes you will need to insert a very large block of sample code that might be too wide or extremely deep.  dpSlate manages this by automatically creating vertical and horizontal scroll bars such that the sample code is preserved without taking up too much space.  The example to the right is an extremely large python program pulled from the Internet.  There is no wrapping of text, instead, your readers need to use horizontal scrolling to see the full code sample.  Also, it is very long, but a maximum height of 50 cm has been set for the display area.  If your sample code exceeds this, then dpSlate will also provide vertical scrolling such that the space is better managed. 

## Inserting a Sample Code into a Particular Tab

You denote a code samples by using three left-single-quote marks followed by the name of the language.  The name of the language is used to place the code sample into the proper tab. Each code samples will appear in the dark area to the right of the main text. Code samples need to appear right under the Level 1 or Level 2 headers in your markdown file to allow them to be anchored properly.

The "language tabs" are the tabs that appear in the upper right of dpSlate Documents. Users browsing the docs use them to select their programming language of choice.

In the sample GFM code to the right, the Ruby code will appear in the Ruby tab, while the Python code will appear in the Python tab. Because the dpSlate engine understands the syntax of most computer programming languages, the sample code will have its language syntax highlighted automatically in a way that would make sense to the developer.

But just because a language is used as sample code within a dpSlate document it does not mean that the tab will appear.  You tell the system which Language tabs you want to display by editing the `language-tabs` list at the top of your GFM source document.

<aside class="success"> Sometimes it is useful to share code between multiple tabs, you can do this by placing tagging the sample code using a language that is not used as a tab name.  For example if you tag sample code as `all` and `all` is not listed in the `language-tabs` then that sample code will appear in all of the tabs.</aside>

## Creating Code Sample Annotations

> Code Sample Annotations

```markdown
> This is a Code Annotation!
```
It is sometimes useful to highlight or annotate a part of the sample code.  This is done with code annotations.  By placing a > as the first character in your GFM line of text, you will create a code annotation that will appear in the area to the right, next to the code samples.

<aside class="warning"> Make sure that you have a blank line after your Code Annotation.  If you do not, the annotation will continue until there is a blank line.
</aside>

# Fun with the Right Hand Panel

When you use the chevron `>` symbol, it takes the entire line and places it into the pannel to the right. Since it does not have a language, it will appear on all of the tabs to the right.  Additionally, because it is not "code" it is not treated as pre-formatted text.  As a result of these factors, the annotation feature can be very useful for placing Markdown or even HTML into the right hand panel.

## A Markdown Table

>The following markdown code:

```markdown

> Table Header 1 | Table Header 2 | Table Header 3
> -------------- | -------------: | :------------:
> Row 1 col 1 | Row 1 col 2 | Row 1 col 3
> Row 2 col 1 | Row 2 col 2 | Row 2 col 3 

```

> will result in the table in the right hand panel:

> Table Header 1 | Table Header 2 | Table Header 3
> -------------- | -------------: | :------------:
> Row 1 col 1 | Row 1 col 2 | Row 1 col 3
> Row 2 col 1 | Row 2 col 2 | Row 2 col 3 

For example, I can use the `>` to place a table into the right hand panel.

## An Image 

>The following markdown code:

```markdown

> ![DP Logo](/images/logo.png).

```

> will result in the image placed into the right hand panel:

> ![DP Logo](/images/logo.png)


Or, I can use the `>` to place an image into the right hand panel.  I can even use the `>` to place HTML code such as a YouTube video or any other content.

# Creating your dpSlate Document

## Previewing your Docs

> Command to Start Your Preview Server

```md
bundle exec middleman server

```

>Output:

```md
  == The Middleman is loading
  == The Middleman is standing watch at http://0.0.0.0:4567
  == Inspect your site configuration at http://0.0.0.0:4567/__middleman/
```

## Building Your Docs If You Forked and Cloned

> Command to create your HTML Files

```md
rake build
```
> Output:

```md
cd dpSlate
bundle exec middleman build --clean
      create  build/images/logo.png
      create  build/images/Untitled.png
      create  build/fonts/icomoon.svg
      create  build/fonts/icomoon.woff
      create  build/fonts/icomoon.ttf
      create  build/fonts/icomoon.eot
      create  build/javascripts/lang_selector.js
      create  build/javascripts/all.js
      create  build/javascripts/jquery_ui.js
      create  build/javascripts/jquery.tocify.js
      create  build/stylesheets/variables.css
      create  build/stylesheets/icon-font.css
      create  build/stylesheets/normalize.css
      create  build/stylesheets/syntax.css
      create  build/stylesheets/screen.css
      create  build/stylesheets/print.css
      create  build/index.html
cd -
```

The `rake build` command tells Middleman to build your website to the `build` directory of your project in a way that is Github compatible.  You then need to share those static HTML files with the DevNet team for publishing.  You can do this via Box.net or Dropbox.

## Building Your Docs If You Installed From Zip

> Command to create your HTML Files

```md
bundle exec middleman build --clean

```
> Output:

```md
      create  build/images/logo.png
      create  build/images/Untitled.png
      create  build/fonts/icomoon.svg
      create  build/fonts/icomoon.woff
      create  build/fonts/icomoon.ttf
      create  build/fonts/icomoon.eot
      create  build/javascripts/lang_selector.js
      create  build/javascripts/all.js
      create  build/javascripts/jquery_ui.js
      create  build/javascripts/jquery.tocify.js
      create  build/stylesheets/variables.css
      create  build/stylesheets/icon-font.css
      create  build/stylesheets/normalize.css
      create  build/stylesheets/syntax.css
      create  build/stylesheets/screen.css
      create  build/stylesheets/print.css
      create  build/index.html
```
The Middleman _build_ option builds your document to the `build` directory of your project.

## Getting Your Document On DevNet

Once you have built and tested your document using dpSlate, you can now get it publish it on DevNet.  You will need to raise a ticket to get your new static HTML files on DevNet for publishing.  You can do this by placing your build directory (with all subdirectories) into a zip, a Box.net folder or a Dropbox folder that you can share with the DevNet team. 

# Elements of Style for API Documentation

Now that you understand the mechanics of dpSlate.  Now we need to get into the specifics of how to use these tools to present a common, consistent, and great developer experience on DevNet for your API.

## The Basics

Before we get into the specifics, let's deal with the high-level guidelines or ground rules:

* _Keep it Simple_ - how you use English to communicate to developers is important.  One of the ways you can simplify things is to use person pronouns (e.g., you, we, us) as this approach will naturally simplify your English.
* _Tell Them How Not What_ - It's possible to simply list all of your API calls, but this does not help the developer.  Instead, group your API end points into what they are used for.  For example, have headings that say "Starting a New Discovery Job" rather than "The Post Discovery Method".
* _Use Examples_ - this format is designed around code samples; use it!  Try to create an example for each of your API calls.
* _Test the Examples_ - when you use an example, make sure that it works.
* _Use Graphics_ - a picture is worth a thousand words.  The right graphic in the right place helps you to keep things simple.

## Language Libraries


REST (or RESTful) APIs are becoming the standard.  Developers like using REST APIs because they are simple and universal.  Because REST APIs use HTTP protocol along with JSON or XML, it is easy to call a REST API from pretty much any programming language.  As a result, there is a natural tendency for the API engineer to think that language libraries (wrappers that make the REST call in the programming language of choice) is not needed. This is a fallacy.

A Programmer can call REST in a language like Python, Java, or C, with four to five lines of code.  When faced with this, the Programmer will typically write their own library of wrappers (code that encapsulates each REST end point) to make programming more module and cleaner.  Thus, if you want your API to be simple to use, you should have the wrappers for popular libraries built.  Next, you should use the language tabs of dpSlate to provide the syntax for each of the programming languages that you will be supporting.
