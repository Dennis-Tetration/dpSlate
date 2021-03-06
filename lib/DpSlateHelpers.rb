
module DpSlateHelpers
  require 'pathname'
  require 'pp'

#
# add_sections() - routine to add section tags (page breaks) wherever there is a <p></p> with a string that contains "+++"
# inputs
#   document - the html output from the page
# outputs
#   document - the html output 
#    

  def add_sections (document)
    return "<section>" + document.gsub(/\<p\>\+\+\+.*\n\<\/p\>/,"</section><section>") + "</section>"
  end  
    
#
# build_button_group() - based upon the settings, build the button group (navbar)
# inputs
#   defaults - the settings hash for the document
# outputs
#   document - the html for the button group 
#    
  def build_button_group (defaults) 
    bg = "<div class='btn-group'>"
    if (defaults["titlePage"])  
      bg += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#titlePage'>
                <span class='glyphicon glyphicon-info-sign'></span>
             </button>"
    end
    if (defaults["documentSearch"])
      bg += "<button type='button' id='documentSearch' class='btn btn-default docSearchBtn'>
               <span class='glyphicon glyphicon-search'></span>
             </button>"
    end
    if (!defaults['siteLinks'].empty?)
      bg += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#siteLinksModal'>
                    <span class='glyphicon glyphicon-link'></span>
                </button>"
    end
    if (!defaults['versionLinks'].empty?)
      bg += "<button type='button' class='btn btn-default' data-toggle='modal' data-target='#versionsModal'>
                    <span class='glyphicon glyphicon-duplicate'></span>
                </button>"
    end
    return bg + "</div>"
  end
#
# build_modals - build the modals for the page
# inputs
#   page_defaults - the YAML settings for the page
# outputs
#   the HTML for the modals on the page
#   
  def build_modals (defaults)
    modals = ""
    if (defaults['titlePage'])
        modals = modals + build_title_page_modal(defaults)
    end
    modals = modals + build_page_directives_modal(defaults)
    if (!defaults['versionLinks'].empty?)
        modals = modals + build_versions_modal(defaults)
    end
    if (!defaults['siteLinks'].empty?)
        modals = modals + build_site_links_modal(defaults)
    end
    return modals
  end  

#
# build_page_directives_modal - routine to build the modal for displaying the page directives
# inputs
#   defaults - the hash that contains all of the settings/directives that were used on the page
# outputs
#   string that contains the HTML for modal
#    
  def build_page_directives_modal (defaults)
      return "<!-- Page Directive Modal -->
              <div class='modal fade' id='pageDirectives' tabindex='-1' role='dialog' aria-labelledby='pageDirectivesLabel'>
                <div class='modal-dialog' role='document'>
                  <div class='modal-content'>
                    <div class='modal-header'>
                      <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                      <span aria-hidden='true'>&times;</span></button>
                      <h4 class='modal-title' id='pageDirectivesLabel'>Page Directives</h4>
                    </div>
                    <div class='modal-body about'>
                        <div class='page-directives'>
                          <p><pre>#{PP.pp(defaults,'')}</pre></p>
                        </div>
                    </div>
                    <div class='modal-footer'>
                      <button type='button' class='btn btn-default tocHelp' data-dismiss='modal'>Close</button>
                    </div>
                  </div>
                </div>
              </div>"
  end      
    
#
# build_title_page_modal - routine to build the modal for displaying the document title page
# inputs
#   defaults - the hash that contains all of the settings/directives that were used on the page
# outputs
#   string that contains the HTML for modal
#      
  def build_title_page_modal (defaults)
      datetime = defaults['mtime'].to_s
      return "<!-- Title Page Modal -->
              <div class='modal fade' id='titlePage' tabindex='-1' role='dialog' aria-labelledby='titlePageLabel'>
                <div class='modal-dialog' role='document'>
                  <div class='modal-content'>
                    <div class='modal-header'>
                        <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
                          <h4 class='modal-title' id='titlePageLabel'>Title Page</h4>
                    </div>
                    <div class='modal-body about'>
                      <div class='title-page'>
                        <h1>#{defaults['title']}</h1>
                        <h2>#{defaults['version']}</h2>
                        <p>#{defaults['copyright']}</p>
                        <p>#{defaults['publisher']}</p>
                        <p>#{defaults['publisherAddress']}</p>
                        <p>#{defaults['comments']}</p>
                        <p>#{datetime[0..15]}</p>
                      </div>
                    </div>
                    <div class='modal-footer'>
                      <a href='#pageDirectives' class='texttrigger' data-toggle='modal'><span class='glyphicon glyphicon-cog'></span></a> 
                        <button type='button' class='btn btn-default tocHelp' data-dismiss='modal'>Close</button>
                    </div>
                  </div>
                </div>
              </div>"
  end

#
# build_site_link_modal - routine to build the modal for displaying different versions of the document
# inputs
#   defaults - the hash that contains all of the settings/directives that were used on the page
# outputs
#   string that contains the HTML for modal
#      
  def build_site_links_modal (defaults)
      linksHTML = "<ul class='nav nav-pills nav-stacked'>"
      defaults["siteLinks"].each do |link|
          linksHTML += "
                <li><a href='#{link['link']}' #{(link['newTab'] ? 'target="_blank"' : "") }>#{link['title']}</a></li>
            "
      end
      linksHTML += "</ul>"
      return   "<!-- Versions Modal -->
              <div class='modal fade' id='siteLinksModal' tabindex='-1' role='dialog' aria-labelledby='siteLinksModalLabel'>
                <div class='modal-dialog' role='document'>
                  <div class='modal-content'>
                    <div class='modal-header'>
                        <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
                          <h4 class='modal-title' id='siteLinksModalLabel'>Site Links</h4>
                    </div>
                    <div class='modal-body about'>
                      <div class='versions'>
                        #{linksHTML}
                      </div>
                    </div>
                    <div class='modal-footer'>
                        <button type='button' class='btn btn-default tocHelp' data-dismiss='modal'>Close</button>
                    </div>
                  </div>
                </div>
              </div>"
  end
    
    
#
# build_toc - routine to build a static toc using HTML
# inputs
#   page_content - the HTML for the page as a single string
#   tocSelectors - string of comma values header tags that should be in the index, e.g., "h1,h2,h3"
# outputs
#   string that contains the HTML for the table of contents
#   
  def build_toc(page_content, tocSelectors)
    html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)     # parse the HTML generated by the Markdown
    tocContent = '<ul class="nav submenu-1" id="nav">'
    prevLevel = 0
    html_doc.css(tocSelectors).each do |header|                         # Loop through the required headers
      currLevel = header.name[1].to_i
      if prevLevel == 0
          prevLevel = currLevel
      end
      if prevLevel > currLevel
        for i in (currLevel..(prevLevel-1))
            tocContent += ' </ul></li>'
        end
      end
      if prevLevel == currLevel
          tocContent += ' </li>'
      end
      if prevLevel < currLevel
          tocContent += ' <ul class="toc-submenu-' + currLevel.to_s + ' nav">'
      end
      tocContent += ' <li class="toc-' + header.name + '"> <a href="#' + header.attribute('id') + '" class="toc-' + header.name + '"> ' + header.content + ' </a>'
      prevLevel = currLevel
    end
    tocContent += ' </ul>'
    return tocContent
  end  
    
#
# build_versions_modal - routine to build the modal for displaying different versions of the document
# inputs
#   defaults - the hash that contains all of the settings/directives that were used on the page
# outputs
#   string that contains the HTML for modal
#      
  def build_versions_modal (defaults)
      versionHTML = "<ul class='nav nav-pills nav-stacked'>"
      defaults["versionLinks"].each do |ver|
          versionHTML = versionHTML + "
                <li><a href='#{ver['link']}' #{(ver['newTab'] ? 'target="_blank"' : "") }>#{ver['title']}</a></li>
            "
      end
      versionHTML = versionHTML + "</ul>"
      return   "<!-- Versions Modal -->
              <div class='modal fade' id='versionsModal' tabindex='-1' role='dialog' aria-labelledby='versionsModalLabel'>
                <div class='modal-dialog' role='document'>
                  <div class='modal-content'>
                    <div class='modal-header'>
                        <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
                          <h4 class='modal-title' id='versionsModalLabel'>Versions of this Document</h4>
                    </div>
                    <div class='modal-body about'>
                      <div class='versions'>
                        #{versionHTML}
                      </div>
                    </div>
                    <div class='modal-footer'>
                        <button type='button' class='btn btn-default tocHelp' data-dismiss='modal'>Close</button>
                    </div>
                  </div>
                </div>
              </div>"
  end

#
# get_defaults() - routine to get and merge the values of the _default.yml files along the directory path
# inputs
#   dirspec - the directory spec of the leaf folder to be used to look for the _defaults.yml files
# outputs
#   a ruby hash that contains the defaults for the page directives it can also include any user defined variables
#
    
  def get_defaults ( dirspec ) 
      if (dirspec == "." or dirspec == "/")
        noDefaults = {
          "title" => "",
          "version" => "",
          "copyright" => "",
          "publisher" => "",
          "publisherAddress" => "",
          "comments" => "",
          "tableOfContents" => true,
          "tocAccordion" => 1,
          "rightPanel" => true,
          "leftPanel" => true,
          "documentSearch" => true,
          "languageTabs" => [ { 'default' => 'Default' } ],
          "tocSelectors" => "h1,h2,h3",
          "tocFooters" => [],
          "versionLinks" => [],
          "siteLinks" => []
        }
        return noDefaults
      else
        this_defaults = read_defaults (dirspec + "/_defaults.yml")
        return get_defaults(Pathname.new(dirspec).parent.to_s).update(this_defaults)    
      end 
  end  
    

#
# get_settings_variables() - routine to replace string variables from defaults wherever there is a string that contains "{{ =variable }}"
# inputs
#   document - the html output from the page
#   defaults - the hash that contains the page directives and variables    
# outputs
#   document - the html output 
#    
  def get_settings_variables (document, defaults)
    # look for an include of the form {{= setting }} split it into the leftHandString, the setting name, and the rightHandString
    if n = document.match(/\{\{\s*\=.*\s*\}\}/)
        setting = n[0].gsub(/\{\{\s*\=|\}\}/, '').strip
        parts = document.split(/\{\{\s*\=.*\}\}/, 2)
        if defaults[setting].nil? 
            parts[0] = parts[0] + n[0]
            replacement = ""
        else
            replacement = defaults[setting].to_s 
        end
        if parts[1].nil? || parts[1].empty?
            return parts[0] + replacement
        else
            return parts[0] + replacement + get_settings_variables(parts[1], defaults)
        end
    else
      return document
    end
  end  
     
#
# read_defaults() - routine to read the _default.yml files
# inputs
#   filespec - the filespec for the _defaults.yml files
# outputs
#   a ruby hash that contains the defaults read from the filespec, if the file is not found, then an empty has is returned
#    

  def read_defaults (filespec)
      if File.exists? ( filespec)
        return defaults = YAML.load_file(filespec)
      else
        return defaults = {}
      end  
  end

end 

